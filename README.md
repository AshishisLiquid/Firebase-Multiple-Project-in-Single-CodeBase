# Firebase-Multiple-Project-in-Single-CodeBase
2 Firebase Projects with Single Code base with Production / Development.
Deployment work with Bash File :

deploy.sh :

Deployment Without Function Updated only deploy firebase hosting deployment for test.

<b>Command</b> :
./deploy.sh
 2. Deployment With Function :
It helps with proper testing functionality. Deployment of function work with suffix as Test.
Command :
Single Function
./deploy.sh :abc
Multiple Functions :
./deploy.sh :abc,cde
3. Production without functions :
Production website can be deployed with this script :
./deploy.sh --prod
 4. Production with functions :
Production function deployment deploy website with functions specified.
./deploy.sh --prod:abc,cde
