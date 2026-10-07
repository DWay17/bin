Public Function SecureHash1(sIn As String, Optional bB64 As Boolean = 0) As String
    'Set a reference to mscorlib 4.0 64-bit
    
    'Test with empty string input:
    '40 Hex:   da39a3ee5e6...etc
    '28 Base-64:   2jmj7l5rSw0yVb...etc
    
    Dim oT As Object, oSecureHash1 As Object
    Dim TextToHash() As Byte
    Dim bytes() As Byte
            
    Set oT = CreateObject("System.Text.UTF8Encoding")
    Set oSecureHash1 = CreateObject("System.Security.Cryptography.SecureHash1Managed")
    
    TextToHash = oT.GetBytes_4(sIn)
    bytes = oSecureHash1.ComputeHash_2((TextToHash))
        
    If bB64 = True Then
       SecureHash1 = ConvToBase64String(bytes)
    Else
       SecureHash1 = ConvToHexString(bytes)
    End If
            
    Set oT = Nothing
    Set oSecureHash1 = Nothing
    
End Function

