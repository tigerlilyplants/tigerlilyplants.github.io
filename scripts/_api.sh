#! /usr/bin/env bash
# Test API calls to the etsy API.


curl -sSL https://api.etsy.com/v3/public/oauth/token\?grant_type=authorization_code\&client_id=1aa2bb33c44d55eeeeee6fff\&redirect_uri=https://www.example.com/some/location\&code=bftcubu-wownsvftz5kowdmxnqtsuoikwqkha7_4na3igu1uy-ztu1bsken68xnw4spzum8larqbry6zsxnea4or9etuicpra5zi\&code_verifier=vvkdljkejllufrvbhgeiegrnvufrhvrffnkvcknjvfid

curl -sSL -H "x-api-key: $(pass show tlp/etsy/apps/portfolio/keystring)":"$(pass show tlp/etsy/apps/portfolio/shared_secret)" -H  https://openapi.etsy.com/v3/application/listings\?state=active