from Crypto.Hash import keccak

def hash(name):
    result = keccak.new(digest_bits=256)
    result = result.update(name.encode('utf8'))
    result = result.hexdigest()[:8]
    return result

def main():
    user_input = input().split('(')
    func_name = user_input[0] + "("
    user_input = user_input[1].split(",")
    arg = []

    for i in user_input:
      arg.append(i.split()[0])
    arg[-1]=arg[-1].replace(")", "")
  
    for j in range(0, len(arg)):
        if arg[j] == "uint":
            arg[j]+="256"
        elif arg[j] == "int":
            arg[j]+="256"
        elif arg[j] == "byte":
            arg[j]+="s1"
    
    result = func_name + ','.join(arg) + ")"
    
    print("[INPUT]", result)
    print("[OUTPUT] 0x"+hash(result))

if __name__ == "__main__":
    main()