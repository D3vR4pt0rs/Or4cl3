import json

def configure_abi(abi_path):
     with open(abi_path) as abi_file:
          abi = json.loads(abi_file.read())
     return abi

def configure_bytecode(bin_path):
    with open(bin_path) as bin_file:
          content = json.loads(bin_file.read())
          bytecode = content['object']
    return bytecode
