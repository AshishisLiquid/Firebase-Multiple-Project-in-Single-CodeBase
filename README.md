# Firebase-Multiple-Project-in-Single-CodeBase
<b>2 Firebase Projects with Single Code base with Production / Development.</b>

Deployment work with Bash File :
<b>deploy.sh :</b>

1. Deployment Without Function:

It Deployes only website to testing purpose.

<b>Command</b> :
*./deploy.sh*

2. Deployment With Function :

It helps with proper testing functionality. Deployment of function work with suffix as Test and website deploy on your testing project

Command :

a. Single Function

*./deploy.sh :abc*
b. Multiple Functions :

*./deploy.sh :abc,cde*

3. Production without functions :

Production website deployment with bash script.

*./deploy.sh --prod*


4. Production with functions :

Production function deployment deploy website with functions specified.

*./deploy.sh --prod:abc,cde|*

Production deployment allow both type of functionality deployment such as single and multiple
