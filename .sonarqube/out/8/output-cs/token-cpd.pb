û
gC:\code\c-sharp\src\github.com\DOS1986\ECTracker\ECTracker.DAL\DataAccess\Interfaces\IDataConnection.cs
	namespace 	
	ECTracker
 
. 
DAL 
. 

DataAccess "
." #

Interfaces# -
{ 
public 

	interface 
IDataConnection $
{ 
List 
< 
Category 
> 
LoadCategories %
(% &
)& '
;' (
Category

 
GetSingle_Category

 #
(

# $
int

$ '

categoryId

( 2
)

2 3
;

3 4
} 
} √
ZC:\code\c-sharp\src\github.com\DOS1986\ECTracker\ECTracker.DAL\DataAccess\JsonConnector.cs
	namespace 	
	ECTracker
 
. 
DAL 
. 

DataAccess "
{		 
public

 

class

 
JsonConnector

 
:

  
IDataConnection

! 0
{ 
private 
readonly 
string 
_jsonString  +
=, -
File. 2
.2 3
ReadAllText3 >
(> ?
$str? N
)N O
;O P
public 
List 
< 
Category 
> 
LoadCategories ,
(, -
)- .
{ 	
List 
< 
Category 
> 
	employees $
=% &
JsonConvert' 2
.2 3
DeserializeObject3 D
<D E
ListE I
<I J
CategoryJ R
>R S
>S T
(T U
_jsonStringU `
)` a
;a b
return 
	employees 
; 
} 	
public 
Category 
GetSingle_Category *
(* +
int+ .

categoryId/ 9
)9 :
{ 	
throw 
new #
NotImplementedException -
(- .
). /
;/ 0
} 	
} 
} Ú
[C:\code\c-sharp\src\github.com\DOS1986\ECTracker\ECTracker.DAL\DataAccess\NoSqlConnector.cs
	namespace		 	
	ECTracker		
 
.		 
DAL		 
.		 

DataAccess		 "
{

 
public 

class 
NoSqlConnector 
:  !
IDataConnection" 1
{ 
private 
readonly 
IDbConnection &
_cnn' +
=, -
GlobalConfig. :
.: ;
GetConnectionString; N
(N O
)O P
;P Q
public 
List 
< 
Category 
> 
LoadCategories ,
(, -
)- .
{ 	
try 
{ 
var 
output 
= 
_cnn !
.! "
Query" '
<' (
Category( 0
>0 1
(1 2
$str2 M
,M N
newO R
DynamicParametersS d
(d e
)e f
)f g
;g h
return 
output 
. 
ToList $
($ %
)% &
;& '
} 
catch 
( 
	Exception 
e 
) 
{ 
throw 
new 
	Exception #
(# $
e$ %
.% &
Message& -
)- .
;. /
} 
} 	
public 
Category 
GetSingle_Category *
(* +
int+ .

categoryId/ 9
)9 :
{ 	
Category 
result 
= 
_cnn "
." #
Query# (
<( )
Category) 1
>1 2
(2 3
$str	3 Ñ
,
Ñ Ö
new
Ü â
{
ä ã

categoryId
å ñ
}
ó ò
)
ò ô
.
ô ö
FirstOrDefault
ö ®
(
® ©
)
© ™
;
™ ´
return 
result 
; 
}   	
}"" 
}## 
\C:\code\c-sharp\src\github.com\DOS1986\ECTracker\ECTracker.DAL\DataAccess\SQLiteConnector.cs
	namespace		 	
	ECTracker		
 
.		 
DAL		 
.		 

DataAccess		 "
{

 
public 

class 
SqLiteConnector  
:! "
IDataConnection# 2
{ 
public 
readonly 
IDbConnection %
Cnn& )
=* +
GlobalConfig, 8
.8 9
GetConnectionString9 L
(L M
)M N
;N O
public 
List 
< 
Category 
> 
LoadCategories ,
(, -
)- .
{ 	
try 
{ 
var 
output 
= 
Cnn  
.  !
Query! &
<& '
Category' /
>/ 0
(0 1
$str1 L
,L M
newN Q
DynamicParametersR c
(c d
)d e
)e f
;f g
return 
output 
. 
ToList $
($ %
)% &
;& '
} 
catch 
( 
	Exception 
e 
) 
{ 
throw 
new 
	Exception #
(# $
e$ %
.% &
Message& -
)- .
;. /
} 
} 	
public 
Category 
GetSingle_Category *
(* +
int+ .

categoryId/ 9
)9 :
{ 	
Category 
result 
= 
Cnn !
.! "
Query" '
<' (
Category( 0
>0 1
(1 2
$str	2 É
,
É Ñ
new
Ö à
{
â ä

categoryId
ã ï
}
ñ ó
)
ó ò
.
ò ô
FirstOrDefault
ô ß
(
ß ®
)
® ©
;
© ™
return 
result 
; 
}   	
}"" 
}## ò&
NC:\code\c-sharp\src\github.com\DOS1986\ECTracker\ECTracker.DAL\DbRepository.cs
	namespace		 	
	ECTracker		
 
.		 
DAL		 
{

 
public 

class 
DbRepository 
{ 
private 
const 
string !
ApplicationFolderName 2
=3 4
$str5 @
;@ A
private 
const 
string 
SqLiteDatabaseName /
=0 1
$str2 @
;@ A
private 
static 
readonly 
string  &
DbFolderPath' 3
=4 5
FullFolderPath6 D
(D E!
ApplicationFolderNameE Z
)Z [
;[ \
private 
static 
SqliteConnection '
DbConnection( 4
{5 6
get7 :
;: ;
set< ?
;? @
}A B
public 
static 
void !
InitializeConnections 0
(0 1
DatabaseType1 =
db> @
)@ A
{ 	
switch 
( 
db 
) 
{ 
case 
DatabaseType !
.! "
SqLite" (
:( )
{ 
CreateAndOpenDb '
(' (
)( )
;) *
break 
; 
} 
case 
DatabaseType !
.! "
NoSql" '
:' (
{ 
CreateAndOpenDb   '
(  ' (
)  ( )
;  ) *
break## 
;## 
}$$ 
case%% 
DatabaseType%% !
.%%! "
Json%%" &
:%%& '
{&& 
JsonConnector'' %
json''& *
=''+ ,
new''- 0
JsonConnector''1 >
(''> ?
)''? @
;''@ A
break)) 
;)) 
}** 
default++ 
:++ 
CreateAndOpenDb,, #
(,,# $
),,$ %
;,,% &
break// 
;// 
}00 
}11 	
public33 
static33 
string33 
FullFolderPath33 +
(33+ ,
string33, 2
applicationFolder333 D
)33D E
{44 	
return55 
Path55 
.55 
Combine55 
(55  
Environment55  +
.55+ ,
GetFolderPath55, 9
(559 :
Environment55: E
.55E F
SpecialFolder55F S
.55S T 
LocalApplicationData55T h
)55h i
,55i j
applicationFolder55k |
)55| }
;55} ~
}66 	
public88 
static88 
SqliteConnection88 &
GetConnectionString88' :
(88: ;
)88; <
{99 	
return:: 
new:: 
SqliteConnection:: '
(::' (
$"::( *
$str::* 6
{::6 7
Path::7 ;
.::; <
Combine::< C
(::C D
DbFolderPath::D P
,::P Q
Path::R V
.::V W
GetFileName::W b
(::b c
SqLiteDatabaseName::c u
)::u v
??::w y
throw::z 
new
::Ä É'
InvalidOperationException
::Ñ ù
(
::ù û
)
::û ü
)
::ü †
}
::† °
$str
::° ¢
"
::¢ £
)
::£ §
;
::§ •
};; 	
public== 
static== 
void== 
CreateAndOpenDb== *
(==* +
)==+ ,
{>> 	
if?? 
(?? 
!?? 
Exists?? 
(?? 
DbFolderPath?? $
)??$ %
)??% &
{@@ 
CreateDirectoryAA 
(AA  
DbFolderPathAA  ,
)AA, -
;AA- .
}BB 
stringDD 

dbFilePathDD 
=DD 
PathDD  $
.DD$ %
CombineDD% ,
(DD, -
DbFolderPathDD- 9
,DD9 :
PathDD; ?
.DD? @
GetFileNameDD@ K
(DDK L
SqLiteDatabaseNameDDL ^
)DD^ _
??DD` b
throwDDc h
newDDi l&
InvalidOperationException	DDm Ü
(
DDÜ á
)
DDá à
)
DDà â
;
DDâ ä
usingEE 
SqliteConnectionEE "

connectionEE# -
=EE. /
DbConnectionEE0 <
=EE= >
newEE? B
SqliteConnectionEEC S
(EES T
$"EET V
$strEEV b
{EEb c

dbFilePathEEc m
}EEm n
"EEn o
)EEo p
;EEp q
newFF 
SeedDatabaseFF 
(FF 
DbConnectionFF )
)FF) *
.FF* +
ExecuteFF+ 2
(FF2 3
)FF3 4
;FF4 5
}GG 	
}HH 
}II ê
TC:\code\c-sharp\src\github.com\DOS1986\ECTracker\ECTracker.DAL\Enums\DatabaseType.cs
	namespace 	
	ECTracker
 
. 
DAL 
. 
Enums 
{ 
[ 
JsonConverter 
( 
typeof 
( 
StringEnumConverter -
)- .
). /
]/ 0
public 

enum 
DatabaseType 
{		 
[

 	

EnumMember

	 
(

 
Value

 
=

 
$str

 $
)

$ %
]

% &
SqLite 
, 
[ 	

EnumMember	 
( 
Value 
= 
$str #
)# $
]$ %
NoSql 
, 
[ 	

EnumMember	 
( 
Value 
= 
$str "
)" #
]# $
Json 
, 
[ 	

EnumMember	 
( 
Value 
= 
$str !
)! "
]" #
Sql 
, 
[ 	

EnumMember	 
( 
Value 
= 
$str #
)# $
]$ %
MySql 
, 
[ 	

EnumMember	 
( 
Value 
= 
$str $
)$ %
]% &
Oracle 
, 
[ 	

EnumMember	 
( 
Value 
= 
$str (
)( )
]) *

Postgresql 
, 
} 
} £0
NC:\code\c-sharp\src\github.com\DOS1986\ECTracker\ECTracker.DAL\GlobalConfig.cs
	namespace

 	
	ECTracker


 
.

 
DAL

 
{ 
public 

static 
class 
GlobalConfig $
{ 
private 
const 
string !
ApplicationFolderName 2
=3 4
$str5 @
;@ A
private 
const 
string 
SqLiteDatabaseName /
=0 1
$str2 @
;@ A
private 
static 
readonly 
string  &
DbFolderPath' 3
=4 5
FullFolderPath6 D
(D E!
ApplicationFolderNameE Z
)Z [
;[ \
private 
static 
string 
_dbFilePath )
=* +
Path, 0
.0 1
Combine1 8
(8 9
DbFolderPath9 E
,E F
PathG K
.K L
GetFileNameL W
(W X
SqLiteDatabaseNameX j
)j k
??l n
throwo t
newu x&
InvalidOperationException	y í
(
í ì
)
ì î
)
î ï
;
ï ñ
private 
static 
SqliteConnection '
DbConnection( 4
{5 6
get7 :
;: ;
set< ?
;? @
}A B
public 
static 
IDataConnection %

Connection& 0
{1 2
get3 6
;6 7
private8 ?
set@ C
;C D
}E F
public 
static 
void !
InitializeConnections 0
(0 1
DatabaseType1 =
db> @
)@ A
{ 	
SqLiteConnector 
sqlite "
=# $
new% (
SqLiteConnector) 8
(8 9
)9 :
;: ;
NoSqlConnector 
noSql  
=! "
new# &
NoSqlConnector' 5
(5 6
)6 7
;7 8
var 
json 
= 
new 
JsonConnector (
(( )
)) *
;* +
switch 
( 
db 
) 
{ 
case 
DatabaseType !
.! "
SqLite" (
:( )
{   
CreateAndOpenDb!! '
(!!' (
)!!( )
;!!) *

Connection"" "
=""# $
sqlite""% +
;""+ ,
break## 
;## 
}$$ 
case%% 
DatabaseType%% !
.%%! "
NoSql%%" '
:%%' (
{&& 
CreateAndOpenDb'' '
(''' (
)''( )
;'') *

Connection(( "
=((# $
noSql((% *
;((* +
break)) 
;)) 
}** 
case++ 
DatabaseType++ !
.++! "
Json++" &
:++& '
{,, 

Connection-- "
=--# $
json--% )
;--) *
break.. 
;.. 
}// 
default00 
:00 
CreateAndOpenDb11 #
(11# $
)11$ %
;11% &

Connection22 
=22  
sqlite22! '
;22' (
break33 
;33 
}44 
}55 	
public77 
static77 
string77 
FullFolderPath77 +
(77+ ,
string77, 2
applicationFolder773 D
)77D E
{88 	
return99 
Path99 
.99 
Combine99 
(99  
Environment99  +
.99+ ,
GetFolderPath99, 9
(999 :
Environment99: E
.99E F
SpecialFolder99F S
.99S T 
LocalApplicationData99T h
)99h i
,99i j
applicationFolder99k |
)99| }
;99} ~
}:: 	
public<< 
static<< 
SqliteConnection<< &
GetConnectionString<<' :
(<<: ;
)<<; <
{== 	
return>> 
new>> 
SqliteConnection>> '
(>>' (
$">>( *
$str>>* 6
{>>6 7
Path>>7 ;
.>>; <
Combine>>< C
(>>C D
DbFolderPath>>D P
,>>P Q
Path>>R V
.>>V W
GetFileName>>W b
(>>b c
SqLiteDatabaseName>>c u
)>>u v
??>>w y
throw>>z 
new
>>Ä É'
InvalidOperationException
>>Ñ ù
(
>>ù û
)
>>û ü
)
>>ü †
}
>>† °
$str
>>° ¢
"
>>¢ £
)
>>£ §
;
>>§ •
}?? 	
publicAA 
staticAA 
voidAA 
CreateAndOpenDbAA *
(AA* +
)AA+ ,
{BB 	
ifCC 
(CC 
!CC 
ExistsCC 
(CC 
DbFolderPathCC $
)CC$ %
)CC% &
{DD 
CreateDirectoryEE 
(EE  
DbFolderPathEE  ,
)EE, -
;EE- .
}FF 
_dbFilePathGG 
=GG 
PathGG 
.GG 
CombineGG &
(GG& '
DbFolderPathGG' 3
,GG3 4
PathGG5 9
.GG9 :
GetFileNameGG: E
(GGE F
SqLiteDatabaseNameGGF X
)GGX Y
??GGZ \
throwGG] b
newGGc f&
InvalidOperationException	GGg Ä
(
GGÄ Å
)
GGÅ Ç
)
GGÇ É
;
GGÉ Ñ
usingHH 
SqliteConnectionHH "

connectionHH# -
=HH. /
DbConnectionHH0 <
=HH= >
newHH? B
SqliteConnectionHHC S
(HHS T
$"HHT V
$strHHV b
{HHb c
_dbFilePathHHc n
}HHn o
"HHo p
)HHp q
;HHq r
newII 
SeedDatabaseII 
(II 
DbConnectionII )
)II) *
.II* +
ExecuteII+ 2
(II2 3
)II3 4
;II4 5
}JJ 	
}KK 
}LL Ã
\C:\code\c-sharp\src\github.com\DOS1986\ECTracker\ECTracker.DAL\Models\ApplicationSettings.cs
	namespace 	
	ECTracker
 
. 
Platform 
. 
DataContract )
.) *
Settings* 2
{ 
public 

class 
ApplicationSettings $
{ 
[ 	
JsonProperty	 
( 
$str -
)- .
]. /
public 
string !
ApplicationFolderName +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
[

 	
JsonProperty

	 
(

 
$str

 0
)

0 1
]

1 2
public 
string $
AttachmentFolderLocation .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
[ 	
JsonProperty	 
( 
$str ,
), -
]- .
public 
string  
AttachmentFolderName *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
[ 	
JsonProperty	 
( 
$str +
)+ ,
], -
public 
string 
ImageFolderLocation )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
[ 	
JsonProperty	 
( 
$str '
)' (
]( )
public 
string 
ImageFolderName %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
} 
} ª
SC:\code\c-sharp\src\github.com\DOS1986\ECTracker\ECTracker.DAL\Models\Attachment.cs
	namespace 	
	ECTracker
 
. 
DAL 
. 
Models 
{ 
public 

class 

Attachment 
{ 
} 
} «
RC:\code\c-sharp\src\github.com\DOS1986\ECTracker\ECTracker.DAL\Models\BaseModel.cs
	namespace 	
	ECTracker
 
. 
DAL 
. 
Models 
{ 
public 

class 
	BaseModel 
{ 
[ 	
JsonProperty	 
( 
$str 
) 
] 
public		 
int		 
Id		 
{		 
get		 
;		 
set		  
;		  !
}		" #
[ 	
JsonProperty	 
( 
$str #
)# $
]$ %
public 
DateTime 
DateCreated #
{$ %
get& )
;) *
set+ .
;. /
}0 1
[ 	
JsonProperty	 
( 
$str $
)$ %
]% &
public 
DateTime 
DateModified $
{% &
get' *
;* +
set, /
;/ 0
}1 2
} 
} Â
QC:\code\c-sharp\src\github.com\DOS1986\ECTracker\ECTracker.DAL\Models\Category.cs
	namespace 	
	ECTracker
 
. 
DAL 
. 
Models 
{ 
public 

class 
Category 
: 
	BaseModel %
{ 
[ 	
JsonProperty	 
( 
$str 
) 
] 
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
[

 	
JsonProperty

	 
(

 
$str

  
)

  !
]

! "
public 
int 
ParentId 
{ 
get !
;! "
set# &
;& '
}( )
[ 	
JsonProperty	 
( 
$str #
)# $
]$ %
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
} ˇ
YC:\code\c-sharp\src\github.com\DOS1986\ECTracker\ECTracker.DAL\Models\DatabaseSettings.cs
	namespace 	
	ECTracker
 
. 
DAL 
. 
Models 
{ 
public 

class 
DatabaseSettings !
{ 
[ 	
JsonProperty	 
( 
$str ,
), -
]- .
public		 
DatabaseType		 
DatabaseType		 (
{		) *
get		+ .
;		. /
set		0 3
;		3 4
}		5 6
[ 	
JsonProperty	 
( 
$str $
)$ %
]% &
public 
string 
DatabaseName "
{# $
get% (
;( )
set* -
;- .
}/ 0
[ 	
JsonProperty	 
( 
$str (
)( )
]) *
public 
string 
ConnectionString &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
[ 	
JsonProperty	 
( 
$str (
,( )
NullValueHandling* ;
=< =
NullValueHandling> O
.O P
IgnoreP V
)V W
]W X
public 
string 
DatabaseUsername &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
[ 	
JsonProperty	 
( 
$str (
,( )
NullValueHandling* ;
=< =
NullValueHandling> O
.O P
IgnoreP V
)V W
]W X
public 
string 
DatabasePassword &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
} 
} ©
TC:\code\c-sharp\src\github.com\DOS1986\ECTracker\ECTracker.DAL\Models\Distributor.cs
	namespace 	
	ECTracker
 
. 
DAL 
. 
Models 
{ 
class 	
Distributor
 
{ 
} 
} •
RC:\code\c-sharp\src\github.com\DOS1986\ECTracker\ECTracker.DAL\Models\Footprint.cs
	namespace 	
	ECTracker
 
. 
DAL 
. 
Models 
{ 
class 	
	Footprint
 
{ 
} 
} µ
ZC:\code\c-sharp\src\github.com\DOS1986\ECTracker\ECTracker.DAL\Models\FootprintCategory.cs
	namespace 	
	ECTracker
 
. 
DAL 
. 
Models 
{ 
class 	
FootprintCategory
 
{ 
} 
} ´
UC:\code\c-sharp\src\github.com\DOS1986\ECTracker\ECTracker.DAL\Models\Manufacturer.cs
	namespace 	
	ECTracker
 
. 
DAL 
. 
Models 
{ 
class 	
Manufacturer
 
{ 
} 
} ±
XC:\code\c-sharp\src\github.com\DOS1986\ECTracker\ECTracker.DAL\Models\MeasurementUnit.cs
	namespace 	
	ECTracker
 
. 
DAL 
. 
Models 
{ 
class 	
MeasurementUnit
 
{ 
} 
} •
RC:\code\c-sharp\src\github.com\DOS1986\ECTracker\ECTracker.DAL\Models\Parameter.cs
	namespace 	
	ECTracker
 
. 
DAL 
. 
Models 
{ 
class 	
	Parameter
 
{ 
} 
} õ
MC:\code\c-sharp\src\github.com\DOS1986\ECTracker\ECTracker.DAL\Models\Part.cs
	namespace 	
	ECTracker
 
. 
DAL 
. 
Models 
{ 
class 	
Part
 
{ 
} 
} ±
XC:\code\c-sharp\src\github.com\DOS1986\ECTracker\ECTracker.DAL\Models\PartDistributor.cs
	namespace 	
	ECTracker
 
. 
DAL 
. 
Models 
{ 
class 	
PartDistributor
 
{ 
} 
} ≥
YC:\code\c-sharp\src\github.com\DOS1986\ECTracker\ECTracker.DAL\Models\PartManufacturer.cs
	namespace 	
	ECTracker
 
. 
DAL 
. 
Models 
{ 
class 	
PartManufacturer
 
{ 
} 
} ≠
VC:\code\c-sharp\src\github.com\DOS1986\ECTracker\ECTracker.DAL\Models\PartParameter.cs
	namespace 	
	ECTracker
 
. 
DAL 
. 
Models 
{ 
class 	
PartParameter
 
{ 
} 
} °
PC:\code\c-sharp\src\github.com\DOS1986\ECTracker\ECTracker.DAL\Models\Project.cs
	namespace 	
	ECTracker
 
. 
DAL 
. 
Models 
{ 
class 	
Project
 
{ 
} 
} µ
ZC:\code\c-sharp\src\github.com\DOS1986\ECTracker\ECTracker.DAL\Models\ProjectAttachment.cs
	namespace 	
	ECTracker
 
. 
DAL 
. 
Models 
{ 
class 	
ProjectAttachment
 
{ 
} 
} ©
TC:\code\c-sharp\src\github.com\DOS1986\ECTracker\ECTracker.DAL\Models\ProjectPart.cs
	namespace 	
	ECTracker
 
. 
DAL 
. 
Models 
{ 
class 	
ProjectPart
 
{ 
} 
} ª	
QC:\code\c-sharp\src\github.com\DOS1986\ECTracker\ECTracker.DAL\Models\Settings.cs
	namespace 	
	ECTracker
 
. 
DAL 
. 
Models 
{ 
public 

class 
Settings 
: 
SettingsManager +
<+ ,
Settings, 4
>4 5
{ 
[ 	
JsonProperty	 
( 
$str  
)  !
]! "
public		 
bool		 
FirstRun		 
{		 
get		 "
;		" #
set		$ '
;		' (
}		) *
[ 	
JsonProperty	 
( 
$str #
)# $
]$ %
public 
ApplicationSettings "
Application# .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
[ 	
JsonProperty	 
( 
$str  
)  !
]! "
public 
DatabaseSettings 
Database  (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
} 
} ò 
XC:\code\c-sharp\src\github.com\DOS1986\ECTracker\ECTracker.DAL\Models\SettingsManager.cs
	namespace 	
	ECTracker
 
. 
DAL 
. 
Models 
{ 
public 

abstract 
class 
SettingsManager )
<) *
T* +
>+ ,
where- 2
T3 4
:5 6
SettingsManager7 F
<F G
TG H
>H I
,I J
newK N
(N O
)O P
{		 
private

 
static

 
readonly

 
string

  &
filePath

' /
=

0 1
GetLocalFilePath

2 B
(

B C
$"

C E
{

E F
typeof

F L
(

L M
T

M N
)

N O
.

O P
Name

P T
}

T U
$str

U Z
"

Z [
)

[ \
;

\ ]
public 
static 
T 
Instance  
{! "
get# &
;& '
private( /
set0 3
;3 4
}5 6
private 
static 
string 
GetLocalFilePath .
(. /
string/ 5
fileName6 >
)> ?
{ 	
string 
appData 
= 
Environment (
.( )
GetFolderPath) 6
(6 7
Environment7 B
.B C
SpecialFolderC P
.P Q 
LocalApplicationDataQ e
)e f
;f g
var 
productName 
= 
Assembly &
.& '
GetEntryAssembly' 7
(7 8
)8 9
.9 :
GetCustomAttributes: M
<M N$
AssemblyProductAttributeN f
>f g
(g h
)h i
.i j
FirstOrDefaultj x
(x y
)y z
;z {
return 
Path 
. 
Combine 
(  
appData  '
,' (
productName) 4
?4 5
.5 6
Product6 =
??> @
AssemblyA I
.I J
GetEntryAssemblyJ Z
(Z [
)[ \
.\ ]
GetName] d
(d e
)e f
.f g
Nameg k
,k l
fileNamem u
)u v
;v w
} 	
public 
static 
void 
Load 
(  
)  !
{ 	
if 
( 
File 
. 
Exists 
( 
filePath $
)$ %
)% &
Instance 
= 
System !
.! "
Text" &
.& '
Json' +
.+ ,
JsonSerializer, :
.: ;
Deserialize; F
<F G
TG H
>H I
(I J
FileJ N
.N O
ReadAllTextO Z
(Z [
filePath[ c
)c d
)d e
;e f
else 
Instance 
= 
new 
T  
(  !
)! "
;" #
} 	
public 
static 
void 
Save 
(  
)  !
{ 	
string 
json 
= 
System  
.  !
Text! %
.% &
Json& *
.* +
JsonSerializer+ 9
.9 :
	Serialize: C
(C D
InstanceD L
)L M
;M N
	Directory   
.   
CreateDirectory   %
(  % &
Path  & *
.  * +
GetDirectoryName  + ;
(  ; <
filePath  < D
)  D E
)  E F
;  F G
File!! 
.!! 
WriteAllText!! 
(!! 
filePath!! &
,!!& '
json!!( ,
)!!, -
;!!- .
}"" 	
}## 
}$$ £
QC:\code\c-sharp\src\github.com\DOS1986\ECTracker\ECTracker.DAL\Models\SIPrefix.cs
	namespace 	
	ECTracker
 
. 
DAL 
. 
Models 
{ 
class 	
SIPrefix
 
{ 
} 
} ´
UC:\code\c-sharp\src\github.com\DOS1986\ECTracker\ECTracker.DAL\Models\StockHistory.cs
	namespace 	
	ECTracker
 
. 
DAL 
. 
Models 
{ 
class 	
StockHistory
 
{ 
} 
} ±
XC:\code\c-sharp\src\github.com\DOS1986\ECTracker\ECTracker.DAL\Models\StorageLocation.cs
	namespace 	
	ECTracker
 
. 
DAL 
. 
Models 
{ 
class 	
StorageLocation
 
{ 
} 
} ¡
`C:\code\c-sharp\src\github.com\DOS1986\ECTracker\ECTracker.DAL\Models\StorageLocationCategory.cs
	namespace 	
	ECTracker
 
. 
DAL 
. 
Models 
{ 
class 	#
StorageLocationCategory
 !
{ 
} 
} õ
MC:\code\c-sharp\src\github.com\DOS1986\ECTracker\ECTracker.DAL\Models\Unit.cs
	namespace 	
	ECTracker
 
. 
DAL 
. 
Models 
{ 
class 	
Unit
 
{ 
} 
} ´
UC:\code\c-sharp\src\github.com\DOS1986\ECTracker\ECTracker.DAL\Models\UnitSIPrefix.cs
	namespace 	
	ECTracker
 
. 
DAL 
. 
Models 
{ 
class 	
UnitSIPrefix
 
{ 
} 
} ØB
NC:\code\c-sharp\src\github.com\DOS1986\ECTracker\ECTracker.DAL\SeedDatabase.cs
	namespace 	
	ECTracker
 
. 
Services 
. 
Common #
.# $
Config$ *
{ 
internal 
class 
SeedDatabase 
{ 
private 
readonly 
SqliteConnection )
_dbConnection* 7
;7 8
public

 
SeedDatabase

 
(

 
SqliteConnection

 ,
dbConnection

- 9
)

9 :
{ 	
_dbConnection 
= 
dbConnection (
;( )
} 	
public 
void 
Execute 
( 
) 
{ 	
CreateCategories 
( 
) 
; %
CreateFootPrintCategories %
(% &
)& '
;' (
CreateFootPrints 
( 
) 
; 
CreateDistributors 
( 
)  
;  !
CreateManufacturers 
(  
)  !
;! "
CreateAttachments 
( 
) 
;  
CreateSiPrefixes 
( 
) 
; 
CreateUnits 
( 
) 
;  
CreateUnitSiPrefixes  
(  !
)! "
;" #"
CreateMeasurementUnits "
(" #
)# $
;$ %
CreateStockHistory 
( 
)  
;  !+
CreateStorageLocationCategories +
(+ ,
), -
;- ."
CreateStorageLocations "
(" #
)# $
;$ %
CreateParameters 
( 
) 
; 
CreateParts 
( 
) 
;  
CreatePartParameters    
(    !
)  ! "
;  " #
CreateProjects!! 
(!! 
)!! 
;!! 
CreateProjectParts"" 
("" 
)""  
;""  !$
CreateProjectAttachments## $
(##$ %
)##% &
;##& '"
CreatePartDistributors$$ "
($$" #
)$$# $
;$$$ %#
CreatePartManufacturers%% #
(%%# $
)%%$ %
;%%% &
}&& 	
public** 
void** 
CreateCategories** $
(**$ %
)**% &
{++ 	
_dbConnection-- 
.-- 
ExecuteNonQuery-- )
(--) *
$str-6* 
)66 
;66 
}77 	
public;; 
void;; %
CreateFootPrintCategories;; -
(;;- .
);;. /
{<< 	
_dbConnection>> 
.>> 
ExecuteNonQuery>> )
(>>) *
$str>G* 
)GG 
;GG 
}HH 	
publicLL 
voidLL 
CreateFootPrintsLL $
(LL$ %
)LL% &
{MM 	
_dbConnectionOO 
.OO 
ExecuteNonQueryOO )
(OO) *
$strOY* 
)YY 
;YY 
}ZZ 	
public__ 
void__ 
CreateDistributors__ &
(__& '
)__' (
{`` 	
_dbConnectionaa 
.aa 
ExecuteNonQueryaa )
(aa) *
$stran* 
)nn 
;nn 
}oo 	
publictt 
voidtt 
CreateManufacturerstt '
(tt' (
)tt( )
{uu 	
_dbConnectionvv 
.vv 
ExecuteNonQueryvv )
(vv) *
$str	vÉ* 
)
ÉÉ 
;
ÉÉ 
}
ÑÑ 	
public
ââ 
void
ââ 
CreateAttachments
ââ %
(
ââ% &
)
ââ& '
{
ää 	
_dbConnection
ãã 
.
ãã 
ExecuteNonQuery
ãã )
(
ãã) *
$str
ãì* 
)
ìì 
;
ìì 
}
îî 	
public
ôô 
void
ôô 
CreateSiPrefixes
ôô $
(
ôô$ %
)
ôô% &
{
öö 	
_dbConnection
õõ 
.
õõ 
ExecuteNonQuery
õõ )
(
õõ) *
$str
õ£* 
)
££ 
;
££ 
}
§§ 	
public
©© 
void
©© 
CreateUnits
©© 
(
©©  
)
©©  !
{
™™ 	
_dbConnection
´´ 
.
´´ 
ExecuteNonQuery
´´ )
(
´´) *
$str
´≤* 
)
≤≤ 
;
≤≤ 
}
≥≥ 	
public
∏∏ 
void
∏∏ "
CreateUnitSiPrefixes
∏∏ (
(
∏∏( )
)
∏∏) *
{
ππ 	
_dbConnection
∫∫ 
.
∫∫ 
ExecuteNonQuery
∫∫ )
(
∫∫) *
$str
∫√* 
)
√√ 
;
√√ 
}
ƒƒ 	
public
»» 
void
»» $
CreateMeasurementUnits
»» *
(
»»* +
)
»»+ ,
{
…… 	
_dbConnection
   
.
   
ExecuteNonQuery
   )
(
  ) *
$str
 —* 
)
—— 
;
—— 
}
““ 	
public
◊◊ 
void
◊◊ -
CreateStorageLocationCategories
◊◊ 3
(
◊◊3 4
)
◊◊4 5
{
ÿÿ 	
_dbConnection
ŸŸ 
.
ŸŸ 
ExecuteNonQuery
ŸŸ )
(
ŸŸ) *
$str
Ÿ‚* 
)
‚‚ 
;
‚‚ 
}
„„ 	
public
ËË 
void
ËË $
CreateStorageLocations
ËË *
(
ËË* +
)
ËË+ ,
{
ÈÈ 	
_dbConnection
ÍÍ 
.
ÍÍ 
ExecuteNonQuery
ÍÍ )
(
ÍÍ) *
$str
ÍÛ* 
)
ÛÛ 
;
ÛÛ 
}
ÙÙ 	
public
˘˘ 
void
˘˘ 
CreateParameters
˘˘ $
(
˘˘$ %
)
˘˘% &
{
˙˙ 	
_dbConnection
˚˚ 
.
˚˚ 
ExecuteNonQuery
˚˚ )
(
˚˚) *
$str
˚å* 
)
åå 
;
åå 
}
çç 	
public
íí 
void
íí 
CreateParts
íí 
(
íí  
)
íí  !
{
ìì 	
_dbConnection
îî 
.
îî 
ExecuteNonQuery
îî )
(
îî) *
$str
î™* 
)
™™ 
;
™™ 
}
´´ 	
public
∞∞ 
void
∞∞  
CreateStockHistory
∞∞ &
(
∞∞& '
)
∞∞' (
{
±± 	
_dbConnection
≤≤ 
.
≤≤ 
ExecuteNonQuery
≤≤ )
(
≤≤) *
$str
≤ª* 
)
ªª 
;
ªª 
}
ºº 	
public
¡¡ 
void
¡¡ "
CreatePartParameters
¡¡ (
(
¡¡( )
)
¡¡) *
{
¬¬ 	
_dbConnection
√√ 
.
√√ 
ExecuteNonQuery
√√ )
(
√√) *
$str
√Ã* 
)
ÃÃ 
;
ÃÃ 
}
ÕÕ 	
public
““ 
void
““ 
CreateProjects
““ "
(
““" #
)
““# $
{
”” 	
_dbConnection
‘‘ 
.
‘‘ 
ExecuteNonQuery
‘‘ )
(
‘‘) *
$str
‘€* 
)
€€ 
;
€€ 
}
‹‹ 	
public
·· 
void
··  
CreateProjectParts
·· &
(
··& '
)
··' (
{
‚‚ 	
_dbConnection
„„ 
.
„„ 
ExecuteNonQuery
„„ )
(
„„) *
$str
„Ò* 
)
ÒÒ 
;
ÒÒ 
}
ÚÚ 	
public
˜˜ 
void
˜˜ &
CreateProjectAttachments
˜˜ ,
(
˜˜, -
)
˜˜- .
{
¯¯ 	
_dbConnection
˘˘ 
.
˘˘ 
ExecuteNonQuery
˘˘ )
(
˘˘) *
$str
˘É* 
)
ÉÉ 
;
ÉÉ 
}
ÑÑ 	
public
ââ 
void
ââ $
CreatePartDistributors
ââ *
(
ââ* +
)
ââ+ ,
{
ää 	
_dbConnection
ãã 
.
ãã 
ExecuteNonQuery
ãã )
(
ãã) *
$str
ãú* 
)
úú 
;
úú 
}
ùù 	
public
¢¢ 
void
¢¢ %
CreatePartManufacturers
¢¢ +
(
¢¢+ ,
)
¢¢, -
{
££ 	
_dbConnection
§§ 
.
§§ 
ExecuteNonQuery
§§ )
(
§§) *
$str
§≥* 
)
≥≥ 
;
≥≥ 
}
¥¥ 	
}
µµ 
}∂∂ ‚
RC:\code\c-sharp\src\github.com\DOS1986\ECTracker\ECTracker.DAL\SQLiteExtensions.cs
	namespace 	
	ECTracker
 
. 
DAL 
{ 
public 

static 
class 
SqLiteExtensions (
{		 
public

 
static

 
void

 
ExecuteNonQuery

 *
(

* +
this

+ /
SqliteConnection

0 @

connection

A K
,

K L
string

M S
commandText

T _
,

_ `
object

a g
param

h m
=

n o
null

p t
)

t u
{ 	
if 
( 

connection 
== 
null "
)" #
{ 
throw 
new !
ArgumentNullException /
(/ 0
nameof0 6
(6 7

connection7 A
)A B
,B C
$strD a
)a b
;b c
} 
if 
( 

connection 
. 
State  
!=! #
ConnectionState$ 3
.3 4
Open4 8
)8 9
{ 

connection 
. 
Open 
(  
)  !
;! "
} 

connection 
. 
Execute 
( 
commandText *
,* +
param, 1
)1 2
;2 3
} 	
} 
} 