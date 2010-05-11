class Response(object):
    """
    This is an envelope that standardizes the response of Dycapo. This is an OpenTrip Dynamic proposal.
    """
    code = -1
    message = ""
    type = ""
    value = {}
    def __init__(self, code, message, type, value):
        self.code = code
        self.message = message
        self.type = type
        self.value = value
        
    def to_xmlrpc(self):
        return self.__dict__
    
    class Meta:
        app_label = 'server'