import piston.utils
import server.response_codes

def get_rc_from_code(status_code):
    for key in piston.utils.rc.CODES.keys():
        if piston.utils.rc.CODES[key][1] == status_code:
            rc = eval('piston.utils.rc.'+key)
            rc.content = ''
            return rc
    return None

def extract_result_from_response(response):
    if response.code != server.response_codes.ALL_OK:
        result = get_rc_from_code(response.code)
        if response.value:
            result.write(response.value)
    else:
        result = response.value
    return result
