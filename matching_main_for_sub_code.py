#matching_main_for_sub_code
import yaml
import json
import os
import pandas as pd
import xlrd
import openpyxl

def getMatchingCode() -> str:
    mapping_stream = open("C:/Users/lokesh.subramaniyan/Documents/python/utils/mapping.yml", "r")
    codes = open("C:/Users/lokesh.subramaniyan/Documents/python/utils/codes.txt", "r").read().split('\n')
    mapping_dict = yaml.safe_load(mapping_stream)
    mapping = {}
    code_dict = []
    for i in mapping_dict:
        mapping.update(mapping_dict[i])
    for i in codes:
        f = 0
        for j in mapping:
            if mapping[j].__contains__(i):
                code_dict.append(j)
                f = 1
                break
        if f == 0:
            code_dict.append('')
    print('\n'.join(code_dict), len(code_dict))
    
def getMessage():
    exception_file_stream = open("C:/Users/lokesh.subramaniyan/Documents/python/utils/mapping.yml", "r")
    vals = open("C:/Users/lokesh.subramaniyan/Documents/python/utils/codes.txt", "r").read().split('\n')
    exception_dict = yaml.safe_load(exception_file_stream)
    code_dict = []
    for i in vals:
        f = 0
        for j in exception_dict:
            if exception_dict[j]["code"] == i:
                print(i, ' - ', j)
                code_dict.append(j)
                f = 1
                break
        if f == 0:
            print(i, ' - ')
            code_dict.append('')
    print('\n'.join(code_dict), len(code_dict))
    
def sortAndRemoveDuplicate():
    distinctList = list(set(open('codes.txt', 'r').read().split('\n')))
    distinctList.sort()
    # splittedExcep = [i.split('\t')[1] for i in distinctList]
    open('op.txt', 'a')
    open('op.txt', 'w').write('\n'.join(distinctList))
    print('\n'.join(distinctList))
    
    
def getExceptionFile():
    codeList = list(set(open('codes.txt', 'r').read().split('\n')))
    codeList.sort()
    excep = lambda s : '  ' + s.split('\t')[1] + ':' + '\n    ' + 'code: ' + s.split('\t')[0] + '\n    ' + 'message: ' + s.split('\t')[1][0] + s.split('\t')[1].lower().replace('_', ' ')[1:] + '.'
    excepList = [excep(i) for i in codeList if i != '\t']
    open('op.yaml', 'a')
    open('op.yaml', 'w').write('\n\n'.join(excepList))
    print('\n\n'.join(excepList), len(excepList))

def comparingExcepAndMapping():
    mapping = yaml.safe_load(open('mapping.yml', 'r'))
    excep = yaml.safe_load(open('excep.yaml', 'r'))
    newM = {}
    for i in mapping:
        newM.update(mapping[i])
    codes = list(set([excep['e5'][i]['code'] for i in excep['e5']]))
    missedInExcep = [i for i in newM if (i in codes) == False]
    missedInMapping = [i for i in codes if (i in newM) == False]
    print('Missing in exception file:\n', '\n'.join(missedInExcep), len(missedInExcep))
    print('Missing in mapping file:\n', '\n'.join(missedInMapping), len(missedInMapping))


'''
Input file must contains
'''
'''
*** Keywords ***
mod-sample
    [Documentation]    Sample
    ...    CODE.E000::EXCEPTION_CODE
    ...    CODE.E001::EXCEPTION_CODE
    ...    CODE.E002::EXCEPTION_CODE
'''
def generateUnitTestCaseFile():
    ipFileName = './robots/modules/components/common/COMP_Header.resource'
    opFileName = './robots/_tests_/components/common/COMP_Header.robot'
    resourceFile = [i for i in open(ipFileName, 'r').read().split('\n') if i != '']
    for root, dirs, files in os.walk(os.getcwd()):
        if 'util.resource' in files:
            testUtilFilePath = os.path.join(root, 'util.resource')
    testUtilFilePath = './' + testUtilFilePath[testUtilFilePath.find('robots'):].replace('\\', '/')
    print('testUtilFilePath:', testUtilFilePath)
    fileName = ipFileName.split('/')[-1].split('.')[0]
    variableBlock = '*** Variables ***\n'
    testCases = '*** Test Cases ***\n'
    keywordsWithBlock = {}
    mods = []
    variables = []
    flag = True
    for i in resourceFile:
        if flag:
            if ('*** Keywords ***' in i):
                flag = False
            continue
        if 'mod-' in i:
            keywordsWithBlock[i] = []
            mods.append(i)
            continue
        if ('    ...    ' in i) and ('::' in i):
            s = i[:-1]
            keywordsWithBlock[mods[-1]].append(s)
    settingBlock = '*** Settings ***\nResource    ' + ipFileName + '\nResource    ' + testUtilFilePath + '\n\nSuite Setup     util.init\n\n\n'
    PositiveBlock = lambda s: 'Positive - ' + s[0].upper() +  s.replace('-', ' ')[1:] + '\n    ' + '[Tags]    ' + s.replace('-', '_') + '_positive\n    ' + 'New Page    ' + '${' + s.replace('-', '_').upper() + '_POSITIVE_URL}\n    ' + fileName + '.' + s + '\n    ' + 'Log To Console    <====' + s.replace('-', ' ').upper()[0] + s.replace('-', ' ')[1:] + ' positive case run successfully====>\n\n'
    negativeBlock = lambda s: 'Negative - ' + s[0].upper() +  s.replace('_', ' ').lower()[1:] + '\n    ' + '[Tags]    ' + key.lower() + '_negative\n    ' + 'New Page    ' + '${' + s + '_URL}\n    ' + 'TRY\n        ' + fileName + '.' + key + '\n    EXCEPT    AS    ${error_code}\n        ' + 'Log To Console    ${error_code}\n        Should Be Equal    ${error_code}    ' + code + '\n    END\n    ' + 'Log To Console    <====' + s[0] + s.lower().replace('_', ' ')[1:] + ' negative case run successfully====>\n\n'
    for key, vals in keywordsWithBlock.items():
        if ('${' + key.replace('-', '_').upper() + '_POSITIVE_URL}    ') not in variables:
            variables.append('${' + key.replace('-', '_').upper() + '_POSITIVE_URL}    ')
        testCases += PositiveBlock(key)
        for val in vals:
            excep = val.split('::')[1]
            code = val.split('::')[0]
            if ('${' + excep + '_URL}    ') not in variables:
                variables.append('${' + excep + '_URL}    ')
            testCases += negativeBlock(excep)
    for var in variables:
        variableBlock += (var + '\n')
    variableBlock += '\n\n'
    print(settingBlock + variableBlock + testCases)
    open(opFileName, 'a')
    open(opFileName, 'w').write(settingBlock + variableBlock + testCases)

def checkVariables():
    l = [i + str(i.replace(' ', '').split('}')[0][2:] == i.replace(' ', '').split('}')[1]) for i in open('codes.txt', 'r').read().split('\n') if ('#' in i) == False and i != '' and i.replace(' ', '').split('}')[0][2:] != i.replace(' ', '').split('}')[1]]
    for i in l:
        print(i)

def getExceptionMappingFile():
    configDict = config()
    xlPath = configDict['file-path']
    opfile = configDict['op-path']
    xlFile = pd.read_excel(xlPath, sheet_name=configDict['sheet-name'], keep_default_na=True)
    mappingDict = {}
    parentName = ''
    for index, row in xlFile.iterrows():
        parentExcep = row[configDict['parent']]
        childExcep = row[configDict['child']]
        if pd.isna(parentExcep) or pd.isna(childExcep):
            continue
        if pd.isna(row[configDict['parent-name']]) == False:
            parentName = row[configDict['parent-name']]
            mappingDict[parentName] = {parentExcep: [childExcep]}
        else:
            if parentExcep in mappingDict[parentName]:
                if childExcep not in mappingDict[parentName][parentExcep]:
                    mappingDict[parentName][parentExcep].append(childExcep)
            else:
                mappingDict[parentName].update({parentExcep: [childExcep]})
    mappingYamlStr = yaml.dump(mappingDict).replace('- ', '  - ')
    createAndWriteOrOverWriteFile(opfile, mappingYamlStr)
    print(mappingYamlStr)

def getErrorCodeForSDK():
    distinctList = list(set(open('codes.txt', 'r').read().split('\n')))
    distinctList.sort()
    errors = {'errors':[{'error_code': i.split('\t')[0], 'error_message': i.split('\t')[1]} for i in distinctList]}
    errorsJson = json.dumps(errors, indent = 2)
    print(errorsJson, len([{'error_code': i.split('\t')[0], 'error_message': i.split('\t')[1]} for i in distinctList]))
    createAndWriteOrOverWriteFile('op.txt', errorsJson)

def script():
        const lastCode = 844;
    y=x.split('\n').map((e, i) => {
        const f = `${e}`
        let message = e.replace(/_/g, " ").toLowerCase();
        message = message.charAt(0).toUpperCase() + message.slice(1);
        const code = `E5.SYSTEM.MODULE.E${formatNumberTo4Digits(i+lastCode+1)}`;
        const result = `  ${f}:\n    code: ${code}\n    message: ${message}`
        return result
    })
    function formatNumberTo4Digits(inputNumber) {
    let numberString = String(inputNumber);
    let leadingZeros = 4 - numberString.length;
    for (let i = 0; i < leadingZeros; i++) {
        numberString = '0' + numberString;
    }
    return numberString;
    }
    y.join('\n\n');
    
def config():
    return yaml.safe_load(open('config.yaml', 'r'))

def createAndWriteOrOverWriteFile(file, fileStr):
    open(file, 'a')
    open(file, 'w').write(fileStr)

if __name__ == '__main__':
    # getMatchingCode()
    # getMessage()
    # sortAndRemoveDuplicate()
    getExceptionFile()
    # comparingExcepAndMapping() 
    # generateUnitTestCaseFile()
    # checkVariables()
    # getExceptionMappingFile()
    # getErrorCodeForSDK()
    # print(config())