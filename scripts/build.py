#!/usr/bin/env python3

from datetime import datetime
from glob import glob
import hashlib
import itertools
import os
from pathlib import Path
import subprocess
import sys
from string import StringFileConverter
from make import ChangeFileLine
import platform

on_wsl = "microsoft" in platform.uname()[3].lower()

if sys.platform.startswith('win'):
    PathVar = os.environ.get('Path')
    Paths = PathVar.split(';')
    PATH = ''
    for candidatePath in Paths:
        if 'devkitARM' in candidatePath:
            PATH = candidatePath
            break
    if PATH == '':
        print('DevKit does not exist in your Path variable.\nChecking default location.')
        PATH = 'C://devkitPro//devkitARM//bin'
        if os.path.isdir(PATH) is False:
            print('...\nDevkit not found.')
            sys.exit(1)
        else:
            print('Devkit found.')

    PREFIX = '/arm-none-eabi-'
    AS = PATH + PREFIX + 'as'
    CC = PATH + PREFIX + 'gcc'
    LD = PATH + PREFIX + 'ld'
    GR = 'deps/grit.exe'
    WAV2AGB = 'deps/wav2agb.exe'
    MID2AGB = ['deps/mid2agb.exe']
    OBJCOPY = PATH + PREFIX + 'objcopy'

else:  # Linux, OSX, etc.
    PREFIX = 'arm-none-eabi-'
    AS = PREFIX + 'as'
    CC = PREFIX + 'gcc'
    LD = PREFIX + 'ld'
    if on_wsl:
        WAV2AGB = 'deps/wav2agb.exe'
        MID2AGB = ['deps/mid2agb.exe']
        GR = "deps/grit.exe"
    else:
        WAV2AGB = 'wav2agb'
        MID2AGB = ['wine', 'deps/mid2agb.exe']
        GR = "grit"

    OBJCOPY = PREFIX + 'objcopy'

SRC = './src'
GRAPHICS = './graphics'
ASSEMBLY = './assembly'
STRINGS = './strings'
AUDIO = './audio'
BUILD = './build'
IMAGES = './Images'
ASFLAGS = ['-mthumb', '-I', ASSEMBLY]
LDFLAGS = ['BPRE.ld', '-T', 'linker.ld']
CFLAGS = ['-mthumb', '-mno-thumb-interwork', '-mcpu=arm7tdmi', '-mtune=arm7tdmi',
          '-mlong-calls', '-march=armv4t', '-Wall', '-Wextra', '-Os', '-fira-loop-pressure', '-fipa-pta']


class Master:
    @staticmethod
    def init():
        Master.printedCompilingImages = False
        Master.printedCompilingAudio = False
        Master.printedCompilingMusic = False

    @staticmethod
    def printCompilingImages():
        if not Master.printedCompilingImages:
            # Used to tell the script whether or not the string 'Compiling Images' has been printed
            Master.printedCompilingImages = True
            print('Compiling Images')

    @staticmethod
    def printCompilingAudio():
        if not Master.printedCompilingAudio:
            # Used to tell the script whether or not the string 'Compiling Audio' has been printed
            Master.printedCompilingAudio = True
            print('Compiling Audio')

    @staticmethod
    def printCompilingMusic():
        if not Master.printedCompilingMusic:
            # Used to tell the script whether or not the string 'Compiling Music' has been printed
            Master.printedCompilingMusic = True
            print('Compiling Music')


def RunCommand(cmd: [str]):
    """Runs the command line command."""
    try:
        env = None
        if cmd[0] == 'wine':
            env = os.environ.copy()
            env['WINEDEBUG'] = '-all'

        subprocess.check_output(cmd, env=env)
    except subprocess.CalledProcessError as e:
        try:
            print(e.output.decode(), file=sys.stderr)
        except:
            print(e)
        sys.exit(1)


def CreateOutputFile(fileName: str, newFileName: str) -> [str, bool]:
    """Helper function to produce object file output."""
    if not os.path.isfile(fileName):
        return [newFileName, False]

    fileExists = os.path.isfile(newFileName)

    # If the object file was created after the file was last modified
    if fileExists and os.path.getmtime(newFileName) > os.path.getmtime(fileName):
        return [newFileName, False]

    return [newFileName, True]


def MakeGeneralOutputFile(fileName: str) -> [str, bool]:
    """Return hash of filename to use as object filename."""
    m = hashlib.md5()
    m.update(fileName.encode())
    newFileName = os.path.join(BUILD, m.hexdigest() + '.o')

    return CreateOutputFile(fileName, newFileName)


def MakeOutputImageFile(assemblyFile: str) -> [str, bool]:
    """Return 'IMG_' + hash of filename to use as object filename."""
    m = hashlib.md5()
    m.update(assemblyFile.encode())
    objectFile = os.path.join(BUILD, 'IMG_' + m.hexdigest() + '.o')

    return CreateOutputFile(assemblyFile, objectFile)


def MakeOutputAudioFile(assemblyFile: str) -> [str, bool]:
    """Return "SND_" + hash of filename to use as object filename."""
    objectFile = os.path.join(BUILD, 'SND_' + assemblyFile.split("Wav_")[1].split(".s")[0] + '.o')
    return CreateOutputFile(assemblyFile, objectFile)


def MakeOutputMusicFile(assemblyFile: str) -> [str, bool]:
    """Return "MUS_" + hash of filename to use as object filename."""
    if sys.platform.startswith('win'):  # Windows
        objectFile = os.path.join(BUILD, 'MUS_'
                                  + assemblyFile.split('\\')[len(assemblyFile.split('\\')) - 1].split(".s")[0] + '.o')
    else:  # Linux, OSX, etc.
        objectFile = os.path.join(BUILD, 'MUS_'
                                  + assemblyFile.split('/')[len(assemblyFile.split('/')) - 1].split(".s")[0] + '.o')

    return CreateOutputFile(assemblyFile, objectFile)


def DoMiddleManAssembly(originalFile: str, assemblyFile: str, flagFile: str, flags: [str],
                        cmd: [str], func, printingFunc, isMusic: bool) -> str:
    """Process assembly files generated by things like grit, wav2agb, or mid2agb."""
    objectFile = func(assemblyFile)[0]
    fileExists = os.path.isfile(objectFile)

    if fileExists \
            and os.path.getmtime(objectFile) > os.path.getmtime(originalFile) \
            and (flagFile == "" or os.path.getmtime(objectFile) > os.path.getmtime(flagFile)):
        # If the .o file was created after the original and flag file were last modified
        return objectFile
    else:  # The original file or the flag file were modified recently
        printingFunc()
        RunCommand(cmd)

    if isMusic:  # Try to update the voicegroup manually
        counter = 0
        lineToChange = ''
        with open(assemblyFile, 'r') as file:
            for line in file:
                counter += 1
                if '_grp,' in line:
                    lineToChange = line.split(',', 1)[0] + ', '
                    break

        voicegroup = GetLegacyMid2AgbFlagValue(flags, '-G')
        if flags != [] and lineToChange != '' and voicegroup is not None:
            ChangeFileLine(assemblyFile, counter, lineToChange + FormatAssemblyValue(voicegroup) + '\n')

    regenerateObjectFile = func(assemblyFile)[1]
    if regenerateObjectFile is False:
        os.remove(assemblyFile)
        return objectFile  # No point in recompiling file

    cmd = [AS] + ASFLAGS + ['-c', assemblyFile, '-o', objectFile]
    RunCommand(cmd)
    os.remove(assemblyFile)
    return objectFile


def ProcessAssembly(assemblyFile: str) -> str:
    """Assemble."""
    objectFile, regenerateObjectFile = MakeGeneralOutputFile(assemblyFile)
    if regenerateObjectFile is False:
        return objectFile  # No point in recompiling file

    try:
        print('Assembling %s' % assemblyFile)
        cmd = [AS] + ASFLAGS + ['-c', assemblyFile, '-o', objectFile]
        RunCommand(cmd)

    except FileNotFoundError:
        print('Error! The assembler could not be located.\n'
              + 'Are you sure you set up your path to devkitPro/devkitARM/bin correctly?')
        sys.exit(1)

    return objectFile


def ProcessC(cFile: str) -> str:
    """Compile C."""
    objectFile, regenerateObjectFile = MakeGeneralOutputFile(cFile)
    if regenerateObjectFile is False:
        return objectFile  # No point in recompiling file

    try:
        print('Compiling %s' % cFile)
        cmd = [CC] + CFLAGS + ['-c', cFile, '-o', objectFile]
        RunCommand(cmd)

    except FileNotFoundError:
        print('Error! The C compiler could not be located.\n'
              + 'Are you sure you set up your path to devkitPro/devkitARM/bin correctly?')
        sys.exit(1)

    return objectFile


def ProcessString(stringFile: str) -> str:
    """Build and assemble strings."""
    assemblyFile = stringFile.split('.string')[0] + '.s'
    objectFile = MakeGeneralOutputFile(assemblyFile)[0]
    fileExists = os.path.isfile(objectFile)

    if fileExists and os.path.getmtime(objectFile) > os.path.getmtime(stringFile):
        # If the .o file was created after the string file was last modified
        return objectFile

    print('Building Strings %s' % stringFile)
    StringFileConverter(stringFile)

    cmd = [AS] + ASFLAGS + ['-c', assemblyFile, '-o', objectFile]
    RunCommand(cmd)
    os.remove(assemblyFile)
    return objectFile


def ProcessImage(imageFile: str) -> str:
    """Compile image."""
    if '.bmp' in imageFile:
        assemblyFile = imageFile.split('.bmp')[0] + '.s'
    else:
        assemblyFile = imageFile.split('.png')[0] + '.s'

    if sys.platform.startswith('win'):
        nameList = imageFile.split('\\')  # Get path of grit flags
        nameList.pop(len(nameList) - 1)
        flagFile = ''.join(str(i) + '\\' for i in nameList)
    else:  # Linux, OSX, etc.
        nameList = imageFile.split('/')  # Get path of grit flags
        nameList.pop(len(nameList) - 1)
        flagFile = ''.join(str(i) + '//' for i in nameList)

    flagFile += 'gritflags.txt'

    try:
        with open(flagFile, 'r') as file:
            line = file.readline()  # Only needs the first line
            flags = line.strip().split()
            cmd = [GR, imageFile] + flags + ['-o', assemblyFile]

    except FileNotFoundError:
        print('Error: No gritflags.txt found in directory with ' + imageFile + '.')
        sys.exit(1)

    return DoMiddleManAssembly(imageFile, assemblyFile, flagFile, flags, cmd,
                               MakeOutputImageFile, Master.printCompilingImages, False)


def ProcessAudio(audioFile: str) -> str:
    """Compile audio."""
    assemblyFile = audioFile.split('.wav')[0] + '.s'

    flags = []
    flagFile = audioFile.split('.wav')[0] + '_flags.txt'

    try:
        with open(flagFile, 'r') as file:
            line = file.readline()  # Only needs the first line
            flags = line.strip().split()
    except FileNotFoundError:
        flagFile = ""

    cmd = [WAV2AGB, audioFile, assemblyFile] + flags

    return DoMiddleManAssembly(audioFile, assemblyFile, flagFile, flags, cmd,
                               MakeOutputAudioFile, Master.printCompilingAudio, False)


def GetLegacyMid2AgbFlagValue(flags: [str], option: str):
    for i, flag in enumerate(flags):
        if flag == option and i + 1 < len(flags):
            return flags[i + 1]
        if flag.startswith(option) and len(flag) > len(option):
            return flag[len(option):]

    return None


def FormatAssemblyValue(value: str) -> str:
    if value.lower().startswith('0x'):
        return str(int(value, 16))

    return value


def NormalizeMid2AgbFlags(flags: [str]) -> [str]:
    """Convert flag files to options accepted by Nintendo's mid2agb.exe."""
    normalized = []
    valueOptions = {
        '-V': '-V',
        '-m': '-V',
        '-P': '-P',
        '-p': '-P',
        '-R': '-R',
        '-r': '-R',
    }
    i = 0

    while i < len(flags):
        flag = flags[i]
        option = flag[:2]

        if flag in ('-G', '-g'):
            i += 2
        elif option in ('-G', '-g') and len(flag) > len(option):
            i += 1
        elif flag in valueOptions and i + 1 < len(flags):
            normalized.append(valueOptions[flag] + flags[i + 1])
            i += 2
        elif option in valueOptions and len(flag) > len(option):
            normalized.append(valueOptions[option] + flag[len(option):])
            i += 1
        else:
            normalized.append(flag)
            i += 1

    return normalized


def ProcessMusic(midiFile: str) -> str:
    """Compile audio."""
    assemblyFile = midiFile.split('.mid')[0] + '.s'

    flags = []
    flagFile = midiFile.split('.mid')[0] + '_flags.txt'

    try:
        with open(flagFile, 'r') as file:
            line = file.readline()  # Only needs the first line
            flags = line.strip().split()
    except FileNotFoundError:
        pass

    cmd = MID2AGB + [midiFile, assemblyFile] + NormalizeMid2AgbFlags(flags)

    return DoMiddleManAssembly(midiFile, assemblyFile, flagFile, flags, cmd,
                               MakeOutputMusicFile, Master.printCompilingMusic, True)


def LinkObjects(objects: itertools.chain) -> str:
    """Link objects into one binary."""
    linked = 'build/linked.o'
    cmd = [LD] + LDFLAGS + ['-o', linked] + list(objects)
    RunCommand(cmd)
    return linked


def Objcopy(binary: str):
    """Run the objcopy."""
    cmd = [OBJCOPY, '-O', 'binary', binary, 'build/output.bin']
    RunCommand(cmd)


def RunGlob(globString: str, fn) -> map:
    """Glob recursively and run the processor function on each file in result."""
    if globString == '**/*.png' or globString == '**/*.bmp':  # Search the GRAPHICS location
        directory = GRAPHICS
    elif globString == '**/*.s':
        directory = ASSEMBLY
    elif globString == '**/*.string':
        directory = STRINGS
    elif globString == '**/*.wav' or globString == '**/*.mid':
        directory = AUDIO
    else:
        directory = SRC

    if sys.version_info > (3, 4):
        try:
            files = glob(os.path.join(directory, globString), recursive=True)
            return map(fn, files)

        except TypeError:
            print('Error compiling. Please make sure Python has been updated to the latest version.')
            sys.exit(1)
    else:
        files = Path(directory).glob(globString)
        return map(fn, map(str, files))


def main():
    Master.init()
    startTime = datetime.now()
    globs = {
            '**/*.s': ProcessAssembly,
            '**/*.c': ProcessC,
            '**/*.string': ProcessString,
            '**/*.png': ProcessImage,
            '**/*.bmp': ProcessImage,
            '**/*.wav': ProcessAudio,
            '**/*.mid': ProcessMusic,
    }

    if sys.version_info.major >= 3 and sys.version_info.minor >= 8:
        print("Warning! Python 3.8 may not be able to build this engine.\nPlease downgrade to Python 3.7.4")

    # Create output directory
    try:
        os.makedirs(BUILD)
    except FileExistsError:
        pass

    try:
        # Gather source files and process them
        objects = itertools.starmap(RunGlob, globs.items())

        # Link and extract raw binary
        linked = LinkObjects(itertools.chain.from_iterable(objects))
        Objcopy(linked)

    except Exception as e:
        print("There was an error compiling the engine: {}".format(e))
        sys.exit(1)

    # Build special_inserts.asm
    if os.path.isfile('special_inserts.asm'):
        if not os.path.isfile('build/special_inserts.bin') \
                or os.path.getmtime('build/special_inserts.bin') < os.path.getmtime('special_inserts.asm'):
            print('Assembling special_inserts.asm')
            cmd = [AS] + ASFLAGS + ['-c', 'special_inserts.asm', '-o', 'build/special_inserts.o']
            RunCommand(cmd)

            cmd = [OBJCOPY, '-O', 'binary', 'build/special_inserts.o', 'build/special_inserts.bin']
            RunCommand(cmd)

    print('Built in ' + str(datetime.now() - startTime) + '.')


if __name__ == '__main__':
    main()
