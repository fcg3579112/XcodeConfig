#!/usr/bin/env bash

__iPhoneOS_To_PATH="/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/usr/lib"
__iPhoneSimulator_To_PATH="/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk/usr/lib"
__MacOSX_To_PATH="/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/lib"
__CoreSimulator_To_Path="/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/CoreSimulator/Profiles/Runtimes/iOS.simruntime/Contents/Resources/RuntimeRoot/usr/lib"

__STDC_PLUS_PLUS_NAME="libstdc++.6.0.9.tbd"
__STDC_PLUS_PLUS_LN1_NAME="libstdc++.6.tbd"
__STDC_PLUS_PLUS_LN2_NAME="libstdc++.tbd"

__STDC_PLUS_PLUS_Dylib_NAME="libstdc++.6.0.9.dylib"
__STDC_PLUS_PLUS_Dylib_LN1_NAME="libstdc++.6.dylib"
__STDC_PLUS_PLUS_Dylib_LN2_NAME="libstdc++.dylib"

# 以下勿动
__SHELL_FOLDER=$(cd "$(dirname "$0")";pwd)
__iPhoneOS_PATH="${__SHELL_FOLDER}/Resources/iPhoneOS/${__STDC_PLUS_PLUS_NAME}"
__iPhoneSimulator_PATH="${__SHELL_FOLDER}/Resources/iPhoneSimulator/${__STDC_PLUS_PLUS_NAME}"
__MacOSX_PATH="${__SHELL_FOLDER}/Resources/MacOSX/${__STDC_PLUS_PLUS_NAME}"
__CoreSimulator_PATH="${__SHELL_FOLDER}/Resources/CoreSimulator/${__STDC_PLUS_PLUS_Dylib_NAME}"

function print_ok_message() {
  echo "\033[32m${1}\033[0m"
}

function print_fail_message() {
  echo "\033[31m${1}\033[0m"
}

print_ok_message "\n执行结果如下:\n"

function cp_ln_file() {
  cur_name=$1
  form_path=$2
  to_path=$3
  orig_name=$4
  ln1_name=$5
  ln2_name=$6
  std_orig_path="${to_path}/${orig_name}"
  std_ln1_path="${to_path}/${ln1_name}"
  std_ln2_path="${to_path}/${ln2_name}"

  if [[ -d "${to_path}" ]]; then
    cp $form_path $to_path

    if [ -f "${std_orig_path}" ];then

      ln -s $std_orig_path $std_ln1_path
      ln -s $std_orig_path $std_ln2_path
      print_ok_message "${cur_name} 文件 ${orig_name} 添加成功...\n添加路径=${to_path}\n"
    else
      print_fail_message "${cur_name} 文件 ${orig_name} 添加失败..."
    fi

    if [[ -f "${std_ln1_path}" ]]; then
      print_ok_message "${cur_name} 文件 ${ln1_name} 添加成功...\n添加路径=${to_path}\n"
    else
      print_fail_message "${cur_name} 文件 ${ln1_name} 添加失败..."
    fi

    if [[ -f "${std_ln2_path}" ]]; then
      print_ok_message "${cur_name} 文件 ${ln2_name} 添加成功...\n添加路径=${to_path}\n"
    else
      print_fail_message "${cur_name} 文件 ${ln2_name} 添加失败...\n"
    fi
  else
    print_fail_message "${cur_name} 添加失败, 请核查 Xcode 是否安装在 /Applications/Xcode.app\n"
  fi
}

# iPhoneOS
if [[ -f "${__iPhoneOS_To_PATH}/${__STDC_PLUS_PLUS_NAME}" ]]; then
  print_fail_message "iPhoneOS 文件 ${__STDC_PLUS_PLUS_NAME} 已经存在，无需重复添加...\n添加路径=${__iPhoneOS_To_PATH}\n"
else
  cp_ln_file "iPhoneOS" $__iPhoneOS_PATH $__iPhoneOS_To_PATH $__STDC_PLUS_PLUS_NAME $__STDC_PLUS_PLUS_LN1_NAME $__STDC_PLUS_PLUS_LN2_NAME
fi

print_ok_message "======================="

# iPhoneSimulator
if [[ -f "${__iPhoneSimulator_To_PATH}/${__STDC_PLUS_PLUS_NAME}" ]]; then
  print_fail_message "iPhoneSimulator 文件 ${__STDC_PLUS_PLUS_NAME} 已经存在，无需重复添加...\n添加路径=${__iPhoneSimulator_To_PATH}\n"
else
  cp_ln_file "iPhoneSimulator" $__iPhoneSimulator_PATH $__iPhoneSimulator_To_PATH $__STDC_PLUS_PLUS_NAME $__STDC_PLUS_PLUS_LN1_NAME $__STDC_PLUS_PLUS_LN2_NAME
fi

print_ok_message "======================="

# MacOSX
if [[ -f "${__MacOSX_To_PATH}/${__STDC_PLUS_PLUS_NAME}" ]]; then
  print_fail_message "MacOSX 文件 ${__STDC_PLUS_PLUS_NAME} 已经存在，无需重复添加...\n添加路径=${__MacOSX_To_PATH}\n"
else
  cp_ln_file "MacOSX" $__MacOSX_PATH $__MacOSX_To_PATH $__STDC_PLUS_PLUS_NAME $__STDC_PLUS_PLUS_LN1_NAME $__STDC_PLUS_PLUS_LN2_NAME
fi

print_ok_message "======================="

# CoreSimulator
if [[ -f "${__CoreSimulator_To_Path}/${__STDC_PLUS_PLUS_Dylib_NAME}" ]]; then
  print_fail_message "CoreSimulator 文件 ${__STDC_PLUS_PLUS_Dylib_NAME} 已经存在，无需重复添加...\n添加路径=${__CoreSimulator_To_Path}\n"
else
  cp_ln_file "CoreSimulator" $__CoreSimulator_PATH $__CoreSimulator_To_Path $__STDC_PLUS_PLUS_Dylib_NAME $__STDC_PLUS_PLUS_Dylib_LN1_NAME $__STDC_PLUS_PLUS_Dylib_LN2_NAME
fi
