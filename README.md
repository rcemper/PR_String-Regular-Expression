# Cache-String-Regular-Expression
A Cache/Ensemble/IRIS string datatype that performs regular expression matching

### Installation:
Import all the source and compile using Atelier or Studio.

### Files included:
MasterLib.DataTypes.StringRgx		The string datatype that enables regular expression testing.
Examples.StringRgx,Person			A persistent class on which one of the properties uses StringRgx.
Examples.StringRgx.Test					A class containing a positive and a negative test using the Person class.

### Documentation:
Refer to the Documatic of the classes for more information.

## Docker    

### Prerequisites
Make sure you have [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) and [Docker desktop](https://www.docker.com/products/docker-desktop) installed.
### Installation
Clone/git pull the repo into any local directory
```
$ git clone https://github.com/rcemper/PR_String-Regular-Expression.git
```
to build and start the container run     
```
$ docker compose up -d && docker compose logs -f
```
A examples are ready to be used.   

To open IRIS Terminal do:   
```
$ docker-compose exec iris iris session iris 
USER>
```
or using **WebTerminal**     
http://localhost:42773/terminal/      

To access IRIS System Management Portal   
http://localhost:42773/csp/sys/UtilHome.csp    
