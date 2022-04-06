local _ENV = {}

_ENV.LOCAL = {
  XS2A_REST_API_URL="localhost:8000/v2.0",
  XS2A_CCMF_GATE_URL="localhost:8001/v1.0",
  XS2A_WSL="http://10.13.18.202:8080/ccmfdpproxy",
  PID="zaqwsx1234567890",
  API_CLIENT_ID="PKO",
  IBAN_1="PL50249000050000400076134538",
  IBAN_2="PL63249000050000400030900682",
  ACCOUNT_BU_TIMEOUT=20
}

_ENV.DEV = {
  XS2A_REST_API_URL="https://srv-fob-xs2a-rest-api.dp.k8s.inteligo.com.pl/v2.0",
  XS2A_CCMF_GATE_URL="https://srv-fob-xs2a-ccmf-gate.dp.k8s.inteligo.com.pl/v1.0",
  XS2A_WSL="http://10.13.18.202:8080/ccmfdpproxy",
  PID="zaqwsx1234567890",
  API_CLIENT_ID="IKO",
  IBAN_1="PL50249000050000400076134538",
  IBAN_2="PL63249000050000400030900682",
  ACCOUNT_BU_TIMEOUT=20,
}

_ENV.DP = {
  XS2A_REST_API_URL="https://srv-fob-xs2a-rest-api.dp.k8s.inteligo.com.pl/v2.0",
  XS2A_CCMF_GATE_URL="https://srv-fob-xs2a-ccmf-gate.dp.k8s.inteligo.com.pl/v1.0",
  XS2A_WSL="http://10.13.18.202:8080/ccmfdpproxy",
  PID="zaqwsx1234567890",
  API_CLIENT_ID="IKO",
  IBAN_1="PL50249000050000400076134538",
  IBAN_2="PL63249000050000400030900682",
  ACCOUNT_BU_TIMEOUT=20,
}

_ENV.QA = {
  XS2A_REST_API_URL="https://srv-fob-xs2a-rest-api.qa.k8s.inteligo.com.pl/v2.0",
  XS2A_CCMF_GATE_URL="https://srv-fob-xs2a-ccmf-gate.qa.k8s.inteligo.com.pl/v1.0",
  XS2A_WSL="http://10.13.18.202:8080/ccmfqaproxy",
  PID="zaqwsx1234567890",
  API_CLIENT_ID="IKO",
  IBAN_1="PL50249000050000400076134538",
  IBAN_2="PL63249000050000400030900682",
  ACCOUNT_BU_TIMEOUT=20,
}

return _ENV
