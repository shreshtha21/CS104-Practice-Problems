def commands(number):
    number = int(number, 2)
    code = {
        1: 'wink',
        2: 'double blink',
        4: 'close your eyes',
        8: 'jump'
    }

    handshake = [
        action
        for bit, action in code.items()
        if number & bit
    ]

    if number & 16:
        handshake.reverse()

    return handshake