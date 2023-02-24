�"
DC:\Projects\HQTrivia\server\HQTrivia\Controllers\AnswerController.cs
	namespace

 	
HQTrivia


 
.

 
Controllers

 
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
AnswerController !
:" #
ControllerBase$ 2
{ 
private 
readonly 
ILogger  
<  !
QuestionController! 3
>3 4
_logger5 <
;< =
private 
readonly 
IAnswerService '
_answerService( 6
;6 7
private 
readonly 
IMapper  
_mapper! (
;( )
public 
AnswerController 
(  
ILogger  '
<' (
QuestionController( :
>: ;
logger< B
,B C
IAnswerServiceD R
answerServiceS `
,` a
IMapperb i
mapperj p
)p q
{ 	
_logger 
= 
logger 
; 
_answerService 
= 
answerService *
;* +
_mapper 
= 
mapper 
; 
} 	
[ 	
HttpGet	 
( 
$str !
,! "
Name# '
=( )
$str* 5
)5 6
]6 7
public 
ActionResult 
< 
	AnswerDTO %
>% &
	GetAnswer' 0
(0 1
int1 4
answerId5 =
)= >
{ 	
_logger 
. 
LogInformation "
(" #
$str# =
+> ?
answerId@ H
)H I
;I J
var 
	answerDto 
= 
new 
	AnswerDTO  )
() *
)* +
;+ ,
try   
{!! 
var"" 
question"" 
="" 
_answerService"" -
.""- .
	GetAnswer"". 7
(""7 8
answerId""8 @
)""@ A
;""A B
_mapper## 
.## 
Map## 
(## 
question## $
,##$ %
	answerDto##& /
)##/ 0
;##0 1
}$$ 
catch%% 
(%% 
InvalidIdException%% %
invalidIdException%%& 8
)%%8 9
{&& 
_logger'' 
.'' 
LogError''  
(''  !
$str''! &
+''' (
answerId'') 1
+''2 3
$str''4 Q
)''Q R
;''R S
return(( 

BadRequest(( !
(((! "
invalidIdException((" 4
.((4 5
Message((5 <
)((< =
;((= >
})) 
return** 
	answerDto** 
;** 
}++ 	
[-- 	

HttpDelete--	 
(-- 
$str-- $
,--$ %
Name--& *
=--+ ,
$str--- ;
)--; <
]--< =
public.. 
IActionResult.. 
DeleteAnswer.. )
(..) *
int..* -
answerId... 6
)..6 7
{// 	
_logger00 
.00 
LogInformation00 "
(00" #
$str00# >
+00? @
answerId00A I
)00I J
;00J K
try11 
{22 
_answerService33 
.33 
RemoveAnswer33 +
(33+ ,
answerId33, 4
)334 5
;335 6
}44 
catch55 
(55 
InvalidIdException55 %
invalidIdException55& 8
)558 9
{66 
_logger77 
.77 
LogError77  
(77  !
$str77! &
+77' (
answerId77) 1
+772 3
$str774 Q
)77Q R
;77R S
return88 

BadRequest88 !
(88! "
invalidIdException88" 4
.884 5
Message885 <
)88< =
;88= >
}99 
return:: 
Ok:: 
(:: 
$str:: ,
+::- .
answerId::/ 7
+::8 9
$str::: U
)::U V
;::V W
};; 	
}<< 
}== �*
KC:\Projects\HQTrivia\server\HQTrivia\Controllers\KafkaProducerController.cs
	namespace		 	
HQTrivia		
 
.		 
Controllers		 
{

 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class #
KafkaProducerController (
:) *
ControllerBase+ 9
{ 
private 
readonly 
ProducerConfig '
config( .
=/ 0
new1 4
ProducerConfig5 C
{ 	
BootstrapServers
 
= 
$str -
}. /
;/ 0
private 
readonly 
string 
topic  %
=& '
$str( 7
;7 8
private 
readonly 
IAnswerService '
_answerService( 6
;6 7
private 
readonly 
IUserService %
_userService& 2
;2 3
public #
KafkaProducerController &
(& '
IUserService' 3
userService4 ?
,? @
IAnswerServiceA O
answerServiceP ]
)] ^
{ 	
_userService 
= 
userService &
;& '
_answerService 
= 
answerService *
;* +
} 	
[ 	
HttpPost	 
] 
public 
IActionResult 

SendAnswer '
(' (
[( )
	FromQuery) 2
]2 3
int4 7
answerId8 @
,@ A
stringB H
usernameI Q
)Q R
{ 	
Answer 
answer 
= 
new 
(  
)  !
;! "
try 
{   
answer!! 
=!! 
_answerService!! '
.!!' (
	GetAnswer!!( 1
(!!1 2
answerId!!2 :
)!!: ;
;!!; <
}"" 
catch## 
(## 
InvalidIdException## %
invalidIdException##& 8
)##8 9
{$$ 
return%% 

BadRequest%% !
(%%! "
invalidIdException%%" 4
.%%4 5
Message%%5 <
)%%< =
;%%= >
}&& 
catch'' 
('' #
AnswerNotFoundException'' *#
answerNotFoundException''+ B
)''B C
{(( 
return)) 

BadRequest)) !
())! "#
answerNotFoundException))" 9
.))9 :
Message)): A
)))A B
;))B C
}** 
return,, 
Created,, 
(,, 
string,, !
.,,! "
Empty,," '
,,,' (
SendToKafka,,) 4
(,,4 5
topic,,5 :
,,,: ;
username,,< D
,,,D E
answer,,F L
),,L M
),,M N
;,,N O
}-- 	
private// 
Object// 
SendToKafka// "
(//" #
string//# )
topic//* /
,/// 0
string//1 7
username//8 @
,//@ A
Answer//B H
answer//I O
)//O P
{00 	
using11 
(11 
var11 
producer11 
=11  !
new22 
ProducerBuilder22 $
<22$ %
string22% +
,22+ ,
string22- 3
>223 4
(224 5
config225 ;
)22; <
.22< =
Build22= B
(22B C
)22C D
)22D E
{33 
try44 
{55 
return66 
producer66 #
.66# $
ProduceAsync66$ 0
(660 1
topic661 6
,666 7
new668 ;
Message66< C
<66C D
string66D J
,66J K
string66L R
>66R S
{77 
Key77 
=77 
username77 $
,77$ %
Value77& +
=77, -
answer77. 4
.774 5
	IsCorrect775 >
.77> ?
ToString77? G
(77G H
)77H I
}77J K
)77K L
.88 

GetAwaiter88 #
(88# $
)88$ %
.99 
	GetResult99 "
(99" #
)99# $
;99$ %
}:: 
catch;; 
(;; 
	Exception;;  
e;;! "
);;" #
{<< 
Console== 
.== 
	WriteLine== %
(==% &
$"==& (
$str==( D
{==D E
e==E F
}==F G
"==G H
)==H I
;==I J
}>> 
}?? 
return@@ 
null@@ 
;@@ 
}AA 	
[CC 	
HttpGetCC	 
(CC 
$strCC !
)CC! "
]CC" #
publicDD 
ActionResultDD 
<DD 
IEnumerableDD '
<DD' (
UserDD( ,
>DD, -
>DD- .
GetLeaderboardDD/ =
(DD= >
)DD> ?
{EE 	
varFF 

userPointsFF 
=FF 
_userServiceFF )
.FF) *
GetLeaderboardFF* 8
(FF8 9
)FF9 :
;FF: ;
returnGG 
OkGG 
(GG 

userPointsGG  
)GG  !
;GG! "
}HH 	
}II 
}JJ �u
FC:\Projects\HQTrivia\server\HQTrivia\Controllers\QuestionController.cs
	namespace

 	
HQTrivia


 
.

 
Controllers

 
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
QuestionController #
:$ %
ControllerBase& 4
{ 
private 
readonly 
ILogger  
<  !
QuestionController! 3
>3 4
_logger5 <
;< =
private 
readonly 
IQuestionService )
_questionService* :
;: ;
private 
readonly 
IMapper  
_mapper! (
;( )
public 
QuestionController !
(! "
ILogger" )
<) *
QuestionController* <
>< =
logger> D
,D E
IQuestionServiceF V
questionServiceW f
,f g
IMapperh o
mapperp v
)v w
{ 	
_logger 
= 
logger 
; 
_questionService 
= 
questionService .
;. /
_mapper 
= 
mapper 
; 
} 	
[ 	
HttpPut	 
( 
$str #
)# $
]$ %
public 
IActionResult 
UpdateQuestion +
(+ ,
int, /

questionId0 :
,: ;
[< =
FromBody= E
]E F
QuestionF N
updatedQuestionO ^
)^ _
{ 	
_logger 
. 
LogInformation "
(" #
$str# @
+A B

questionIdC M
)M N
;N O
try 
{ 
_questionService    
.    !
Update  ! '
(  ' (

questionId  ( 2
,  2 3
updatedQuestion  4 C
)  C D
;  D E
}!! 
catch"" 
("" &
QuestionTextEmptyException"" -&
questionTextEmptyException"". H
)""H I
{## 
_logger$$ 
.$$ 
LogError$$  
($$  !
$str$$! ?
)$$? @
;$$@ A
return%% 

BadRequest%% !
(%%! "&
questionTextEmptyException%%" <
.%%< =
Message%%= D
)%%D E
;%%E F
}&& 
catch'' 
('' .
"MultipleAnswersAreCorrectException'' 5.
"multipleAnswersAreCorrectException''6 X
)''X Y
{(( 
_logger)) 
.)) 
LogError))  
())  !
$str))! E
)))E F
;))F G
return** 

BadRequest** !
(**! ".
"multipleAnswersAreCorrectException**" D
.**D E
Message**E L
)**L M
;**M N
}++ 
catch,, 
(,, +
OneAnswerMustBeCorrectException,, 2+
oneAnswerMustBeCorrectException,,3 R
),,R S
{-- 
_logger.. 
... 
LogError..  
(..  !
$str..! =
)..= >
;..> ?
return// 

BadRequest// !
(//! "+
oneAnswerMustBeCorrectException//" A
.//A B
Message//B I
)//I J
;//J K
}00 
catch11 
(11 %
DurationNotValidException11 ,%
durationNotValidException11- F
)11F G
{22 
_logger33 
.33 
LogError33  
(33  !
$str33! R
)33R S
;33S T
return44 

BadRequest44 !
(44! "%
durationNotValidException44" ;
.44; <
Message44< C
)44C D
;44D E
}55 
return66 
Ok66 
(66 
updatedQuestion66 %
)66% &
;66& '
}77 	
[99 	
	HttpPatch99	 
(99 
$str99 %
)99% &
]99& '
public:: 
IActionResult:: !
UpdatePartialQuestion:: 2
(::2 3
int::3 6

questionId::7 A
,::A B
[::C D
FromBody::D L
]::L M
JsonPatchDocument::N _
<::_ `
Question::` h
>::h i
patchEntity::j u
)::u v
{;; 	
_logger<< 
.<< 
LogInformation<< "
(<<" #
$str<<# J
+<<K L

questionId<<M W
)<<W X
;<<X Y
var>> 
question>> 
=>> 
_questionService>> +
.>>+ ,
GetQuestion>>, 7
(>>7 8

questionId>>8 B
)>>B C
;>>C D
if@@ 
(@@ 

questionId@@ 
>=@@ 
$num@@ 
&&@@  "
question@@# +
==@@, .
null@@/ 3
)@@3 4
{AA 
returnBB 
NotFoundBB 
(BB  
)BB  !
;BB! "
}CC 
patchEntityEE 
.EE 
ApplyToEE 
(EE  
questionEE  (
,EE( )

ModelStateEE* 4
)EE4 5
;EE5 6
_questionServiceFF 
.FF 
UpdatePartialFF *
(FF* +
questionFF+ 3
)FF3 4
;FF4 5
returnGG 
OkGG 
(GG 
questionGG 
)GG 
;GG  
}HH 	
[JJ 	
HttpGetJJ	 
(JJ 
$strJJ #
,JJ# $
NameJJ% )
=JJ* +
$strJJ, 9
)JJ9 :
]JJ: ;
publicKK 
ActionResultKK 
<KK 
QuestionDTOKK '
>KK' (
GetQuestionKK) 4
(KK4 5
intKK5 8

questionIdKK9 C
)KKC D
{LL 	
_loggerMM 
.MM 
LogInformationMM "
(MM" #
$strMM# ?
+MM@ A

questionIdMMB L
)MML M
;MMM N
varNN 
questionDtoNN 
=NN 
newNN !
QuestionDTONN" -
(NN- .
)NN. /
;NN/ 0
tryOO 
{PP 
varQQ 
questionQQ 
=QQ 
_questionServiceQQ /
.QQ/ 0
GetQuestionQQ0 ;
(QQ; <

questionIdQQ< F
)QQF G
;QQG H
_mapperRR 
.RR 
MapRR 
(RR 
questionRR $
,RR$ %
questionDtoRR& 1
)RR1 2
;RR2 3
}SS 
catchTT 
(TT %
QuestionNotFoundExceptionTT ,%
questionNotFoundExceptionTT- F
)TTF G
{UU 
_loggerVV 
.VV 
LogErrorVV  
(VV  !
$strVV! 4
+VV5 6

questionIdVV7 A
+VVB C
$strVVD U
)VVU V
;VVV W
returnWW 
NotFoundWW 
(WW  %
questionNotFoundExceptionWW  9
.WW9 :
MessageWW: A
)WWA B
;WWB C
}XX 
catchYY 
(YY 
InvalidIdExceptionYY %
invalidIdExceptionYY& 8
)YY8 9
{ZZ 
_logger[[ 
.[[ 
LogError[[  
([[  !
$str[[! &
+[[' (

questionId[[) 3
+[[4 5
$str[[6 S
)[[S T
;[[T U
return\\ 

BadRequest\\ !
(\\! "
invalidIdException\\" 4
.\\4 5
Message\\5 <
)\\< =
;\\= >
}]] 
return^^ 
questionDto^^ 
;^^ 
}__ 	
[aa 	
HttpPostaa	 
]aa 
publicbb 
ActionResultbb 
<bb 
Questionbb $
>bb$ %
CreateQuestionbb& 4
(bb4 5
[bb5 6
FromBodybb6 >
]bb> ?
Questionbb@ H
questionToCreatebbI Y
)bbY Z
{cc 	
_loggerdd 
.dd 
LogInformationdd "
(dd" #
$strdd# :
)dd: ;
;dd; <
tryee 
{ff 
_questionServicegg  
.gg  !
Addgg! $
(gg$ %
questionToCreategg% 5
)gg5 6
;gg6 7
}hh 
catchii 
(ii &
QuestionTextEmptyExceptionii -&
questionTextEmptyExceptionii. H
)iiH I
{jj 
_loggerkk 
.kk 
LogErrorkk  
(kk  !
$strkk! ?
)kk? @
;kk@ A
returnll 

BadRequestll !
(ll! "&
questionTextEmptyExceptionll" <
.ll< =
Messagell= D
)llD E
;llE F
}mm 
catchnn 
(nn .
"MultipleAnswersAreCorrectExceptionnn 5.
"multipleAnswersAreCorrectExceptionnn6 X
)nnX Y
{oo 
_loggerpp 
.pp 
LogErrorpp  
(pp  !
$strpp! E
)ppE F
;ppF G
returnqq 

BadRequestqq !
(qq! ".
"multipleAnswersAreCorrectExceptionqq" D
.qqD E
MessageqqE L
)qqL M
;qqM N
}rr 
catchss 
(ss +
OneAnswerMustBeCorrectExceptionss 2+
oneAnswerMustBeCorrectExceptionss3 R
)ssR S
{tt 
_loggeruu 
.uu 
LogErroruu  
(uu  !
$struu! =
)uu= >
;uu> ?
returnvv 

BadRequestvv !
(vv! "+
oneAnswerMustBeCorrectExceptionvv" A
.vvA B
MessagevvB I
)vvI J
;vvJ K
}ww 
catchxx 
(xx %
DurationNotValidExceptionxx ,%
durationNotValidExceptionxx- F
)xxF G
{yy 
_loggerzz 
.zz 
LogErrorzz  
(zz  !
$strzz! R
)zzR S
;zzS T
return{{ 

BadRequest{{ !
({{! "%
durationNotValidException{{" ;
.{{; <
Message{{< C
){{C D
;{{D E
}|| 
return}} 
Ok}} 
(}} 
questionToCreate}} &
)}}& '
;}}' (
}~~ 	
[
�� 	

HttpDelete
��	 
(
�� 
$str
�� &
,
��& '
Name
��( ,
=
��- .
$str
��/ ?
)
��? @
]
��@ A
public
�� 
IActionResult
�� 
DeleteQuestion
�� +
(
��+ ,
int
��, /

questionId
��0 :
)
��: ;
{
�� 	
_logger
�� 
.
�� 
LogInformation
�� "
(
��" #
$str
��# @
+
��A B

questionId
��C M
)
��M N
;
��N O
try
�� 
{
�� 
_questionService
��  
.
��  !
Remove
��! '
(
��' (

questionId
��( 2
)
��2 3
;
��3 4
}
�� 
catch
�� 
(
�� '
QuestionNotFoundException
�� ,'
questionNotFoundException
��- F
)
��F G
{
�� 
_logger
�� 
.
�� 
LogError
��  
(
��  !
$str
��! 4
+
��5 6

questionId
��7 A
+
��B C
$str
��D U
)
��U V
;
��V W
return
�� 
NotFound
�� 
(
��  '
questionNotFoundException
��  9
.
��9 :
Message
��: A
)
��A B
;
��B C
}
�� 
catch
�� 
(
��  
InvalidIdException
�� % 
invalidIdException
��& 8
)
��8 9
{
�� 
_logger
�� 
.
�� 
LogError
��  
(
��  !
$str
��! &
+
��' (

questionId
��) 3
+
��4 5
$str
��6 S
)
��S T
;
��T U
return
�� 

BadRequest
�� !
(
��! " 
invalidIdException
��" 4
.
��4 5
Message
��5 <
)
��< =
;
��= >
}
�� 
return
�� 
Ok
�� 
(
�� 
$str
�� .
+
��/ 0

questionId
��1 ;
+
��< =
$str
��> Y
)
��Y Z
;
��Z [
}
�� 	
[
�� 	
HttpGet
��	 
(
�� 
$str
�� :
)
��: ;
]
��; <
public
�� 
ActionResult
�� 
<
�� 
IEnumerable
�� '
<
��' (
QuestionDTO
��( 3
>
��3 4
>
��4 5(
GetUnsentQuestionsFromQuiz
��6 P
(
��P Q
int
��Q T
quizId
��U [
)
��[ \
{
�� 	
_logger
�� 
.
�� 
LogInformation
�� "
(
��" #
$str
��# Q
+
��R S
quizId
��T Z
)
��Z [
;
��[ \
List
�� 
<
�� 
QuestionDTO
�� 
>
��  
questionsUnsentDto
�� 0
=
��1 2
new
��3 6
List
��7 ;
<
��; <
QuestionDTO
��< G
>
��G H
(
��H I
)
��I J
;
��J K
try
�� 
{
�� 
var
�� 
questionsUnsent
�� #
=
��$ %
_questionService
��& 6
.
��6 7(
GetUnsentQuestionsFromQuiz
��7 Q
(
��Q R
quizId
��R X
)
��X Y
;
��Y Z
_mapper
�� 
.
�� 
Map
�� 
(
�� 
questionsUnsent
�� +
,
��+ , 
questionsUnsentDto
��- ?
)
��? @
;
��@ A
}
�� 
catch
�� 
(
�� #
QuizNotFoundException
�� (#
quizNotFoundException
��) >
)
��> ?
{
�� 
_logger
�� 
.
�� 
LogError
��  
(
��  !
$str
��! 0
+
��1 2
quizId
��3 9
+
��: ;
$str
��< M
)
��M N
;
��N O
return
�� 
NotFound
�� 
(
��  #
quizNotFoundException
��  5
.
��5 6
Message
��6 =
)
��= >
;
��> ?
}
�� 
catch
�� 
(
��  
InvalidIdException
�� % 
invalidIdException
��& 8
)
��8 9
{
�� 
_logger
�� 
.
�� 
LogError
��  
(
��  !
$str
��! &
+
��' (
quizId
��) /
+
��0 1
$str
��2 O
)
��O P
;
��P Q
return
�� 

BadRequest
�� !
(
��! " 
invalidIdException
��" 4
.
��4 5
Message
��5 <
)
��< =
;
��= >
}
�� 
return
�� 
Ok
�� 
(
��  
questionsUnsentDto
�� (
)
��( )
;
��) *
}
�� 	
}
�� 
}�� ��
BC:\Projects\HQTrivia\server\HQTrivia\Controllers\QuizController.cs
	namespace 	
HQTrivia
 
. 
Controllers 
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
QuizController 
:  !
ControllerBase" 0
{ 
private 
readonly 
ILogger  
<  !
QuizController! /
>/ 0
_logger1 8
;8 9
private 
readonly 
IQuizService %
_quizService& 2
;2 3
private 
readonly 
IUserService %
_userService& 2
;2 3
private 
IHubContext 
< 
QuizHub #
,# $
IQuizHub% -
>- .
_quizHub/ 7
;7 8
private 
readonly 
IMapper  
_mapper! (
;( )
public 
QuizController 
( 
ILogger %
<% &
QuizController& 4
>4 5
logger6 <
,< =
IQuizService> J
quizServiceK V
,V W
IUserServiceX d
userServicee p
,p q
IHubContextr }
<} ~
QuizHub	~ �
,
� �
IQuizHub
� �
>
� �
quizHub
� �
,
� �
IMapper
� �
mapper
� �
)
� �
{ 	
_logger 
= 
logger 
; 
_quizService 
= 
quizService &
;& '
_quizHub 
= 
quizHub 
; 
_userService   
=   
userService   &
;  & '
_mapper!! 
=!! 
mapper!! 
;!! 
}"" 	
[$$ 	
HttpGet$$	 
]$$ 
public%% 
ActionResult%% 
<%% 
IEnumerable%% '
<%%' (
QuizDTO%%( /
>%%/ 0
>%%0 1

GetQuizzes%%2 <
(%%< =
)%%= >
{&& 	
_logger'' 
.'' 
LogInformation'' "
(''" #
$str''# 8
)''8 9
;''9 :
var(( 
quizzes(( 
=(( 
_quizService(( &
.((& '
GetAllQuizzes((' 4
(((4 5
)((5 6
;((6 7
List)) 
<)) 
QuizDTO)) 
>)) 

quizzesDto)) $
=))% &
new))' *
List))+ /
<))/ 0
QuizDTO))0 7
>))7 8
())8 9
)))9 :
;)): ;
_mapper** 
.** 
Map** 
(** 
quizzes** 
,**  

quizzesDto**! +
)**+ ,
;**, -
return++ 
Ok++ 
(++ 

quizzesDto++  
)++  !
;++! "
},, 	
[.. 	
HttpGet..	 
(.. 
$str.. 
,..  
Name..! %
=..& '
$str..( 1
)..1 2
]..2 3
public// 
ActionResult// 
<// 
QuizDTO// #
>//# $
GetQuiz//% ,
(//, -
int//- 0
quizId//1 7
)//7 8
{00 	
_logger22 
.22 
LogInformation22 "
(22" #
$str22# ;
+22< =
quizId22> D
)22D E
;22E F
var33 
quiz33 
=33 
new33 
Quiz33 
(33  
)33  !
;33! "
var44 
quizDto44 
=44 
new44 
QuizDTO44 %
(44% &
)44& '
;44' (
try55 
{66 
quiz77 
=77 
_quizService77 #
.77# $
GetQuiz77$ +
(77+ ,
quizId77, 2
)772 3
;773 4
quizDto88 
=88 
_mapper88 !
.88! "
Map88" %
<88% &
QuizDTO88& -
>88- .
(88. /
quiz88/ 3
)883 4
;884 5
}99 
catch:: 
(:: !
QuizNotFoundException:: (!
quizNotFoundException::) >
)::> ?
{;; 
_logger<< 
.<< 
LogError<<  
(<<  !
$str<<! 0
+<<1 2
quizId<<3 9
+<<: ;
$str<<< M
)<<M N
;<<N O
return== 
NotFound== 
(==  !
quizNotFoundException==  5
.==5 6
Message==6 =
)=== >
;==> ?
}>> 
catch?? 
(?? 
InvalidIdException?? %
invalidIdException??& 8
)??8 9
{@@ 
_loggerAA 
.AA 
LogErrorAA  
(AA  !
$strAA! &
+AA' (
quizIdAA) /
+AA0 1
$strAA2 O
)AAO P
;AAP Q
returnBB 

BadRequestBB !
(BB! "
invalidIdExceptionBB" 4
.BB4 5
MessageBB5 <
)BB< =
;BB= >
}CC 
returnDD 
quizDtoDD 
;DD 
}EE 	
[HH 	
	HttpPatchHH	 
(HH 
$strHH !
)HH! "
]HH" #
publicII 
IActionResultII 
UpdatePartialQuizII .
(II. /
intII/ 2
quizIdII3 9
,II9 :
[II; <
FromBodyII< D
]IID E
JsonPatchDocumentIIF W
<IIW X
QuizIIX \
>II\ ]
patchEntityII^ i
)IIi j
{JJ 	
varKK 
quizKK 
=KK 
_quizServiceKK #
.KK# $
GetQuizKK$ +
(KK+ ,
quizIdKK, 2
)KK2 3
;KK3 4
ifMM 
(MM 
quizIdMM 
>=MM 
$numMM 
&&MM 
quizMM #
==MM$ &
nullMM' +
)MM+ ,
{NN 
returnOO 
NotFoundOO 
(OO  
)OO  !
;OO! "
}PP 
patchEntityRR 
.RR 
ApplyToRR 
(RR  
quizRR  $
,RR$ %

ModelStateRR& 0
)RR0 1
;RR1 2
_quizServiceSS 
.SS 
UpdatePartialSS &
(SS& '
quizSS' +
)SS+ ,
;SS, -
returnTT 
OkTT 
(TT 
quizTT 
)TT 
;TT 
}UU 	
[VV	 

HttpPutVV
 
(VV 
$strVV  
)VV  !
]VV! "
publicWW 
IActionResultWW 

UpdateQuizWW '
(WW' (
intWW( +
quizIdWW, 2
,WW2 3
[WW4 5
FromBodyWW5 =
]WW= >
QuizWW? C
updatedQuizWWD O
)WWO P
{XX 	
_loggerYY 
.YY 
LogInformationYY "
(YY" #
$strYY# <
+YY= >
quizIdYY? E
)YYE F
;YYF G
tryZZ 
{[[ 
_quizService\\ 
.\\ 
Update\\ #
(\\# $
quizId\\$ *
,\\* +
updatedQuiz\\, 7
)\\7 8
;\\8 9
}]] 
catch^^ 
(^^ "
QuizNameEmptyException^^ )"
quizNameEmptyExcpetion^^* @
)^^@ A
{__ 
_logger`` 
.`` 
LogError``  
(``  !
$str``! ;
)``; <
;``< =
returnaa 

BadRequestaa !
(aa! ""
quizNameEmptyExcpetionaa" 8
.aa8 9
Messageaa9 @
)aa@ A
;aaA B
}bb 
catchcc 
(cc $
QuizNameTooLongExceptioncc +$
quizNameTooLongExceptioncc, D
)ccD E
{dd 
_loggerff 
.ff 
LogErrorff  
(ff  !
$strff! I
)ffI J
;ffJ K
returngg 

BadRequestgg !
(gg! "$
quizNameTooLongExceptiongg" :
.gg: ;
Messagegg; B
)ggB C
;ggC D
}hh 
catchii 
(ii )
StartingDateNotValidExceptionii 0)
startingDateNotValidExceptionii1 N
)iiN O
{jj 
_loggerkk 
.kk 
LogErrorkk  
(kk  !
$strkk! :
)kk: ;
;kk; <
returnll 

BadRequestll !
(ll! ")
startingDateNotValidExceptionll" ?
.ll? @
Messagell@ G
)llG H
;llH I
}mm 
catchnn 
(nn "
PrizeNotValidExceptionnn )"
prizeNotValidExceptionnn* @
)nn@ A
{oo 
_loggerpp 
.pp 
LogErrorpp  
(pp  !
$strpp! C
)ppC D
;ppD E
returnqq 

BadRequestqq !
(qq! ""
prizeNotValidExceptionqq" 8
.qq8 9
Messageqq9 @
)qq@ A
;qqA B
}rr 
returnss 
Okss 
(ss 
updatedQuizss !
)ss! "
;ss" #
}tt 	
[ww 	
HttpPostww	 
(ww 
$strww 
)ww 
]ww  
publicxx 
ActionResultxx 
<xx 
Quizxx  
>xx  !

CreateQuizxx" ,
(xx, -
[xx- .
FromBodyxx. 6
]xx6 7
Quizxx8 <
quizToCreatexx= I
)xxI J
{yy 	
_loggerzz 
.zz 
LogInformationzz "
(zz" #
$strzz# 6
)zz6 7
;zz7 8
try{{ 
{|| 
_quizService}} 
.}} 
Add}}  
(}}  !
quizToCreate}}! -
)}}- .
;}}. /
}~~ 
catch 
( "
QuizNameEmptyException )"
quizNameEmptyExcpetion* @
)@ A
{
�� 
_logger
�� 
.
�� 
LogError
��  
(
��  !
$str
��! ;
)
��; <
;
��< =
return
�� 

BadRequest
�� !
(
��! "$
quizNameEmptyExcpetion
��" 8
.
��8 9
Message
��9 @
)
��@ A
;
��A B
}
�� 
catch
�� 
(
�� &
QuizNameTooLongException
�� +&
quizNameTooLongException
��, D
)
��D E
{
�� 
_logger
�� 
.
�� 
LogError
��  
(
��  !
$str
��! I
)
��I J
;
��J K
return
�� 

BadRequest
�� !
(
��! "&
quizNameTooLongException
��" :
.
��: ;
Message
��; B
)
��B C
;
��C D
}
�� 
catch
�� 
(
�� +
StartingDateNotValidException
�� 0+
startingDateNotValidException
��1 N
)
��N O
{
�� 
_logger
�� 
.
�� 
LogError
��  
(
��  !
$str
��! :
)
��: ;
;
��; <
return
�� 

BadRequest
�� !
(
��! "+
startingDateNotValidException
��" ?
.
��? @
Message
��@ G
)
��G H
;
��H I
}
�� 
catch
�� 
(
�� $
PrizeNotValidException
�� )$
prizeNotValidException
��* @
)
��@ A
{
�� 
_logger
�� 
.
�� 
LogError
��  
(
��  !
$str
��! C
)
��C D
;
��D E
return
�� 

BadRequest
�� !
(
��! "$
prizeNotValidException
��" 8
.
��8 9
Message
��9 @
)
��@ A
;
��A B
}
�� 
return
�� 
Ok
�� 
(
�� 
quizToCreate
�� "
)
��" #
;
��# $
}
�� 	
[
�� 	

HttpDelete
��	 
(
�� 
$str
�� "
,
��" #
Name
��$ (
=
��) *
$str
��+ 7
)
��7 8
]
��8 9
public
�� 
IActionResult
�� 

DeleteQuiz
�� '
(
��' (
int
��( +
quizId
��, 2
)
��2 3
{
�� 	
_logger
�� 
.
�� 
LogInformation
�� "
(
��" #
$str
��# <
+
��= >
quizId
��? E
)
��E F
;
��F G
try
�� 
{
�� 
_quizService
�� 
.
�� 
Remove
�� #
(
��# $
quizId
��$ *
)
��* +
;
��+ ,
}
�� 
catch
�� 
(
�� #
QuizNotFoundException
�� (#
quizNotFoundException
��) >
)
��> ?
{
�� 
_logger
�� 
.
�� 
LogError
��  
(
��  !
$str
��! 0
+
��1 2
quizId
��3 9
+
��: ;
$str
��< M
)
��M N
;
��N O
return
�� 
NotFound
�� 
(
��  #
quizNotFoundException
��  5
.
��5 6
Message
��6 =
)
��= >
;
��> ?
}
�� 
catch
�� 
(
��  
InvalidIdException
�� % 
invalidIdException
��& 8
)
��8 9
{
�� 
_logger
�� 
.
�� 
LogError
��  
(
��  !
$str
��! &
+
��' (
quizId
��) /
+
��0 1
$str
��2 O
)
��O P
;
��P Q
return
�� 

BadRequest
�� !
(
��! " 
invalidIdException
��" 4
.
��4 5
Message
��5 <
)
��< =
;
��= >
}
�� 
return
�� 
Ok
�� 
(
�� 
$str
�� *
+
��+ ,
quizId
��- 3
+
��4 5
$str
��6 P
)
��P Q
;
��Q R
}
�� 	
[
�� 	
HttpPost
��	 
(
�� 
$str
�� %
)
��% &
]
��& '
public
�� 
IActionResult
�� 
AddQuestionToQuiz
�� .
(
��. /
int
��/ 2

questionId
��3 =
,
��= >
int
��? B
quizId
��C I
)
��I J
{
�� 	
_logger
�� 
.
�� 
LogInformation
�� "
(
��" #
$str
��# >
+
��? @

questionId
��A K
+
��L M
$str
��N b
+
��c d
quizId
��e k
)
��k l
;
��l m
try
�� 
{
�� 
_quizService
�� 
.
�� 
AddQuestionToQuiz
�� .
(
��. /

questionId
��/ 9
,
��9 :
quizId
��; A
)
��A B
;
��B C
}
�� 
catch
�� 
(
�� #
QuizNotFoundException
�� (#
quizNotFoundException
��) >
)
��> ?
{
�� 
_logger
�� 
.
�� 
LogError
��  
(
��  !
$str
��! 0
+
��1 2
quizId
��3 9
+
��: ;
$str
��< M
)
��M N
;
��N O
return
�� 
NotFound
�� 
(
��  #
quizNotFoundException
��  5
.
��5 6
Message
��6 =
)
��= >
;
��> ?
}
�� 
catch
�� 
(
�� '
QuestionNotFoundException
�� ,'
questionNotFoundException
��- F
)
��F G
{
�� 
_logger
�� 
.
�� 
LogError
��  
(
��  !
$str
��! 4
+
��5 6

questionId
��7 A
+
��B C
$str
��D U
)
��U V
;
��V W
return
�� 
NotFound
�� 
(
��  '
questionNotFoundException
��  9
.
��9 :
Message
��: A
)
��A B
;
��B C
}
�� 
catch
�� 
(
��  
InvalidIdException
�� % 
invalidIdException
��& 8
)
��8 9
{
�� 
_logger
�� 
.
�� 
LogError
��  
(
��  !
$str
��! @
)
��@ A
;
��A B
return
�� 

BadRequest
�� !
(
��! " 
invalidIdException
��" 4
.
��4 5
Message
��5 <
)
��< =
;
��= >
}
�� 
return
�� 
Ok
�� 
(
�� 
)
�� 
;
�� 
}
�� 	
[
�� 	
HttpPost
��	 
(
�� 
$str
�� *
)
��* +
]
��+ ,
public
�� 
IActionResult
�� $
RemoveQuestionFromQuiz
�� 3
(
��3 4
int
��4 7

questionId
��8 B
,
��B C
int
��D G
quizId
��H N
)
��N O
{
�� 	
_logger
�� 
.
�� 
LogInformation
�� "
(
��" #
$str
��# @
+
��A B

questionId
��C M
+
��N O
$str
��P d
+
��e f
quizId
��g m
)
��m n
;
��n o
try
�� 
{
�� 
_quizService
�� 
.
�� $
RemoveQuestionFromQuiz
�� 3
(
��3 4

questionId
��4 >
,
��> ?
quizId
��@ F
)
��F G
;
��G H
}
�� 
catch
�� 
(
�� #
QuizNotFoundException
�� (#
quizNotFoundException
��) >
)
��> ?
{
�� 
_logger
�� 
.
�� 
LogError
��  
(
��  !
$str
��! 0
+
��1 2
quizId
��3 9
+
��: ;
$str
��< M
)
��M N
;
��N O
return
�� 
NotFound
�� 
(
��  #
quizNotFoundException
��  5
.
��5 6
Message
��6 =
)
��= >
;
��> ?
}
�� 
catch
�� 
(
�� '
QuestionNotFoundException
�� ,'
questionNotFoundException
��- F
)
��F G
{
�� 
_logger
�� 
.
�� 
LogError
��  
(
��  !
$str
��! 4
+
��5 6

questionId
��7 A
+
��B C
$str
��D U
)
��U V
;
��V W
return
�� 
NotFound
�� 
(
��  '
questionNotFoundException
��  9
.
��9 :
Message
��: A
)
��A B
;
��B C
}
�� 
catch
�� 
(
��  
InvalidIdException
�� % 
invalidIdException
��& 8
)
��8 9
{
�� 
_logger
�� 
.
�� 
LogError
��  
(
��  !
$str
��! @
)
��@ A
;
��A B
return
�� 

BadRequest
�� !
(
��! " 
invalidIdException
��" 4
.
��4 5
Message
��5 <
)
��< =
;
��= >
}
�� 
return
�� 
Ok
�� 
(
�� 
)
�� 
;
�� 
}
�� 	
[
�� 	
HttpPost
��	 
(
�� 
$str
�� *
)
��* +
]
��+ ,
public
�� 
IActionResult
�� 
	ResetQuiz
�� &
(
��& '
int
��' *
quizId
��+ 1
)
��1 2
{
�� 	
_logger
�� 
.
�� 
LogInformation
�� "
(
��" #
$str
��# =
+
��> ?
quizId
��@ F
)
��F G
;
��G H
var
�� 
quiz
�� 
=
�� 
new
�� 
Quiz
�� 
(
��  
)
��  !
;
��! "
try
�� 
{
�� 
quiz
�� 
=
�� 
_quizService
�� #
.
��# $
GetQuiz
��$ +
(
��+ ,
quizId
��, 2
)
��2 3
;
��3 4
}
�� 
catch
�� 
(
�� #
QuizNotFoundException
�� (#
quizNotFoundException
��) >
)
��> ?
{
�� 
_logger
�� 
.
�� 
LogError
��  
(
��  !
$str
��! 0
+
��1 2
quizId
��3 9
+
��: ;
$str
��< M
)
��M N
;
��N O
return
�� 
NotFound
�� 
(
��  #
quizNotFoundException
��  5
.
��5 6
Message
��6 =
)
��= >
;
��> ?
}
�� 
catch
�� 
(
��  
InvalidIdException
�� % 
invalidIdException
��& 8
)
��8 9
{
�� 
_logger
�� 
.
�� 
LogError
��  
(
��  !
$str
��! &
+
��' (
quizId
��) /
+
��0 1
$str
��2 O
)
��O P
;
��P Q
return
�� 

BadRequest
�� !
(
��! " 
invalidIdException
��" 4
.
��4 5
Message
��5 <
)
��< =
;
��= >
}
�� 
_quizService
�� 
.
�� 
	ResetQuiz
�� "
(
��" #
quiz
��# '
)
��' (
;
��( )
var
�� 
quizDto
�� 
=
�� 
new
�� 
QuizDTO
�� %
(
��% &
)
��& '
;
��' (
quizDto
�� 
=
�� 
_mapper
�� 
.
�� 
Map
�� !
<
��! "
QuizDTO
��" )
>
��) *
(
��* +
quiz
��+ /
)
��/ 0
;
��0 1
_quizHub
�� 
.
�� 
Clients
�� 
.
�� 
All
��  
.
��  !
	ResetQuiz
��! *
(
��* +
quizDto
��+ 2
)
��2 3
;
��3 4
return
�� 
Ok
�� 
(
�� 
$str
�� %
)
��% &
;
��& '
}
�� 	
[
�� 	
HttpPost
��	 
(
�� 
$str
�� )
)
��) *
]
��* +
public
�� 
IActionResult
�� 
OpenQuiz
�� %
(
��% &
int
��& )
quizId
��* 0
)
��0 1
{
�� 	
_logger
�� 
.
�� 
LogInformation
�� "
(
��" #
$str
��# ;
+
��< =
quizId
��> D
)
��D E
;
��E F
var
�� 
quiz
�� 
=
�� 
new
�� 
Quiz
�� 
(
��  
)
��  !
;
��! "
try
�� 
{
�� 
quiz
�� 
=
�� 
_quizService
�� #
.
��# $
GetQuiz
��$ +
(
��+ ,
quizId
��, 2
)
��2 3
;
��3 4
}
�� 
catch
�� 
(
�� #
QuizNotFoundException
�� (#
quizNotFoundException
��) >
)
��> ?
{
�� 
_logger
�� 
.
�� 
LogError
��  
(
��  !
$str
��! 0
+
��1 2
quizId
��3 9
+
��: ;
$str
��< M
)
��M N
;
��N O
return
�� 
NotFound
�� 
(
��  #
quizNotFoundException
��  5
.
��5 6
Message
��6 =
)
��= >
;
��> ?
}
�� 
catch
�� 
(
��  
InvalidIdException
�� % 
invalidIdException
��& 8
)
��8 9
{
�� 
_logger
�� 
.
�� 
LogError
��  
(
��  !
$str
��! @
)
��@ A
;
��A B
return
�� 

BadRequest
�� !
(
��! " 
invalidIdException
��" 4
.
��4 5
Message
��5 <
)
��< =
;
��= >
}
�� 
_userService
�� 
.
�� 

ResetUsers
�� #
(
��# $
)
��$ %
;
��% &
_quizService
�� 
.
�� 
OpenQuiz
�� !
(
��! "
quiz
��" &
)
��& '
;
��' (
var
�� 
quizDto
�� 
=
�� 
new
�� 
QuizDTO
�� %
(
��% &
)
��& '
;
��' (
quizDto
�� 
=
�� 
_mapper
�� 
.
�� 
Map
�� !
<
��! "
QuizDTO
��" )
>
��) *
(
��* +
quiz
��+ /
)
��/ 0
;
��0 1
_quizHub
�� 
.
�� 
Clients
�� 
.
�� 
All
��  
.
��  !
OpenQuiz
��! )
(
��) *
quizDto
��* 1
)
��1 2
;
��2 3
return
�� 
Ok
�� 
(
�� 
$str
�� 0
)
��0 1
;
��1 2
}
�� 	
[
�� 	
HttpPost
��	 
(
�� 
$str
�� *
)
��* +
]
��+ ,
public
�� 
IActionResult
�� 
	StartQuiz
�� &
(
��& '
int
��' *
quizId
��+ 1
)
��1 2
{
�� 	
_logger
�� 
.
�� 
LogInformation
�� "
(
��" #
$str
��# <
+
��= >
quizId
��? E
)
��E F
;
��F G
var
�� 
quiz
�� 
=
�� 
new
�� 
Quiz
�� 
(
��  
)
��  !
;
��! "
try
�� 
{
�� 
quiz
�� 
=
�� 
_quizService
�� #
.
��# $
GetQuiz
��$ +
(
��+ ,
quizId
��, 2
)
��2 3
;
��3 4
}
�� 
catch
�� 
(
�� #
QuizNotFoundException
�� (#
quizNotFoundException
��) >
)
��> ?
{
�� 
_logger
�� 
.
�� 
LogError
��  
(
��  !
$str
��! 0
+
��1 2
quizId
��3 9
+
��: ;
$str
��< M
)
��M N
;
��N O
return
�� 
NotFound
�� 
(
��  #
quizNotFoundException
��  5
.
��5 6
Message
��6 =
)
��= >
;
��> ?
}
�� 
catch
�� 
(
��  
InvalidIdException
�� % 
invalidIdException
��& 8
)
��8 9
{
�� 
_logger
�� 
.
�� 
LogError
��  
(
��  !
$str
��! @
)
��@ A
;
��A B
return
�� 

BadRequest
�� !
(
��! " 
invalidIdException
��" 4
.
��4 5
Message
��5 <
)
��< =
;
��= >
}
�� 
_quizService
�� 
.
�� 
	StartQuiz
�� "
(
��" #
quiz
��# '
)
��' (
;
��( )
var
�� 
quizDto
�� 
=
�� 
new
�� 
QuizDTO
�� %
(
��% &
)
��& '
;
��' (
quizDto
�� 
=
�� 
_mapper
�� 
.
�� 
Map
�� !
<
��! "
QuizDTO
��" )
>
��) *
(
��* +
quiz
��+ /
)
��/ 0
;
��0 1
_quizHub
�� 
.
�� 
Clients
�� 
.
�� 
All
��  
.
��  !
	StartQuiz
��! *
(
��* +
quizDto
��+ 2
)
��2 3
;
��3 4
return
�� 
Ok
�� 
(
�� 
$str
�� '
)
��' (
;
��( )
}
�� 	
[
�� 	
HttpPost
��	 
(
�� 
$str
�� +
)
��+ ,
]
��, -
public
�� 
ActionResult
�� 
<
�� 
IEnumerable
�� '
<
��' (
User
��( ,
>
��, -
>
��- .

FinishQuiz
��/ 9
(
��9 :
int
��: =
quizId
��> D
)
��D E
{
�� 	
_logger
�� 
.
�� 
LogInformation
�� "
(
��" #
$str
��# =
+
��> ?
quizId
��@ F
)
��F G
;
��G H
var
�� 
quiz
�� 
=
�� 
new
�� 
Quiz
�� 
(
��  
)
��  !
;
��! "
try
�� 
{
�� 
quiz
�� 
=
�� 
_quizService
�� #
.
��# $
GetQuiz
��$ +
(
��+ ,
quizId
��, 2
)
��2 3
;
��3 4
}
�� 
catch
�� 
(
�� #
QuizNotFoundException
�� (#
quizNotFoundException
��) >
)
��> ?
{
�� 
_logger
�� 
.
�� 
LogError
��  
(
��  !
$str
��! 0
+
��1 2
quizId
��3 9
+
��: ;
$str
��< M
)
��M N
;
��N O
return
�� 
NotFound
�� 
(
��  #
quizNotFoundException
��  5
.
��5 6
Message
��6 =
)
��= >
;
��> ?
}
�� 
catch
�� 
(
��  
InvalidIdException
�� % 
invalidIdException
��& 8
)
��8 9
{
�� 
_logger
�� 
.
�� 
LogError
��  
(
��  !
$str
��! @
)
��@ A
;
��A B
return
�� 

BadRequest
�� !
(
��! " 
invalidIdException
��" 4
.
��4 5
Message
��5 <
)
��< =
;
��= >
}
�� 
_quizService
�� 
.
�� 

FinishQuiz
�� #
(
��# $
quiz
��$ (
)
��( )
;
��) *
var
�� 
quizDto
�� 
=
�� 
new
�� 
QuizDTO
�� %
(
��% &
)
��& '
;
��' (
quizDto
�� 
=
�� 
_mapper
�� 
.
�� 
Map
�� !
<
��! "
QuizDTO
��" )
>
��) *
(
��* +
quiz
��+ /
)
��/ 0
;
��0 1
_quizHub
�� 
.
�� 
Clients
�� 
.
�� 
All
��  
.
��  !

FinishQuiz
��! +
(
��+ ,
quizDto
��, 3
)
��3 4
;
��4 5
var
�� 
users
�� 
=
�� 
_userService
�� $
.
��$ %
GetLeaderboard
��% 3
(
��3 4
)
��4 5
;
��5 6
return
�� 
Ok
�� 
(
�� 
users
�� 
)
�� 
;
�� 
}
�� 	
[
�� 	
HttpPost
��	 
(
�� 
$str
�� >
)
��> ?
]
��? @
public
�� 
IActionResult
�� 
SendQuestion
�� )
(
��) *
int
��* -
quizId
��. 4
,
��4 5
int
��6 9

questionId
��: D
)
��D E
{
�� 	
_logger
�� 
.
�� 
LogInformation
�� "
(
��" #
$str
��# I
+
��J K
quizId
��L R
)
��R S
;
��S T
var
�� 
quiz
�� 
=
�� 
new
�� 
Quiz
�� 
(
��  
)
��  !
;
��! "
try
�� 
{
�� 
quiz
�� 
=
�� 
_quizService
�� #
.
��# $
GetQuiz
��$ +
(
��+ ,
quizId
��, 2
)
��2 3
;
��3 4
}
�� 
catch
�� 
(
�� #
QuizNotFoundException
�� (#
quizNotFoundException
��) >
)
��> ?
{
�� 
_logger
�� 
.
�� 
LogError
��  
(
��  !
$str
��! 0
+
��1 2
quizId
��3 9
+
��: ;
$str
��< M
)
��M N
;
��N O
return
�� 
NotFound
�� 
(
��  #
quizNotFoundException
��  5
.
��5 6
Message
��6 =
)
��= >
;
��> ?
}
�� 
catch
�� 
(
��  
InvalidIdException
�� % 
invalidIdException
��& 8
)
��8 9
{
�� 
_logger
�� 
.
�� 
LogError
��  
(
��  !
$str
��! &
+
��' (
quizId
��) /
+
��0 1
$str
��2 O
)
��O P
;
��P Q
return
�� 

BadRequest
�� !
(
��! " 
invalidIdException
��" 4
.
��4 5
Message
��5 <
)
��< =
;
��= >
}
�� 
var
�� 
question
�� 
=
�� 
_quizService
�� '
.
��' (
SendQuestion
��( 4
(
��4 5
quiz
��5 9
,
��9 :

questionId
��; E
)
��E F
;
��F G
var
�� 
questionDto
�� 
=
�� 
_mapper
�� %
.
��% &
Map
��& )
<
��) *
QuestionDTO
��* 5
>
��5 6
(
��6 7
question
��7 ?
)
��? @
;
��@ A
_quizHub
�� 
.
�� 
Clients
�� 
.
�� 
All
��  
.
��  !
GetQuestion
��! ,
(
��, -
questionDto
��- 8
)
��8 9
;
��9 :
return
�� 
Ok
�� 
(
�� 
$str
�� 2
)
��2 3
;
��3 4
}
�� 	
[
�� 	
HttpGet
��	 
(
�� 
$str
�� !
)
��! "
]
��" #
public
�� 
ActionResult
�� 
<
�� 
IEnumerable
�� '
<
��' (
QuizDTO
��( /
>
��/ 0
>
��0 1
GetPastQuizzes
��2 @
(
��@ A
)
��A B
{
�� 	
_logger
�� 
.
�� 
LogInformation
�� "
(
��" #
$str
��# M
)
��M N
;
��N O
var
�� 
quizzes
�� 
=
�� 
_quizService
�� &
.
��& '
GetAllPastQuizzes
��' 8
(
��8 9
)
��9 :
;
��: ;
var
�� 

quizzesDto
�� 
=
�� 
new
��  
List
��! %
<
��% &
QuizDTO
��& -
>
��- .
(
��. /
)
��/ 0
;
��0 1
_mapper
�� 
.
�� 
Map
�� 
(
�� 
quizzes
�� 
,
��  

quizzesDto
��! +
)
��+ ,
;
��, -
return
�� 
Ok
�� 
(
�� 

quizzesDto
��  
)
��  !
;
��! "
}
�� 	
}
�� 
}�� �	
;C:\Projects\HQTrivia\server\HQTrivia\Hubs\IHubs\IQuizHub.cs
	namespace 	
HQTrivia
 
. 
Hubs 
. 
IHubs 
{ 
public 

	interface 
IQuizHub 
{ 
Task 
GetQuestion 
( 
QuestionDTO $
question% -
)- .
;. /
Task		 
JoinMessage		 
(		 
string		 
message		  '
)		' (
;		( )
Task

 
	ResetQuiz

 
(

 
QuizDTO

 
quizDto

 &
)

& '
;

' (
Task 
OpenQuiz 
( 
QuizDTO 
quizDto %
)% &
;& '
Task 
	StartQuiz 
( 
QuizDTO 
quizDto &
)& '
;' (
Task 

FinishQuiz 
( 
QuizDTO 
quizDto  '
)' (
;( )
Task 
UpdateScore 
( 
int 
score "
)" #
;# $
} 
} �
4C:\Projects\HQTrivia\server\HQTrivia\Hubs\QuizHub.cs
	namespace 	
HQTrivia
 
. 
Hubs 
{ 
public 

class 
QuizHub 
: 
Hub 
< 
IQuizHub '
>' (
{ 
private 
static 
readonly 
ConnectionMapping  1
<1 2
string2 8
>8 9
_connections: F
=G H
newI L
ConnectionMappingM ^
<^ _
string_ e
>e f
(f g
)g h
;h i
private 
IUserRepository 
_userRepository  /
;/ 0
public 
QuizHub 
( 
IUserRepository &
userRepository' 5
)5 6
{ 	
_userRepository 
= 
userRepository ,
;, -
} 	
public 
async 
Task 
JoinQuiz "
(" #
string# )
username* 2
,2 3
string4 :
quizName; C
)C D
{ 	
_connections 
. 
Add 
( 
username %
,% &
Context' .
.. /
ConnectionId/ ;
); <
;< =
await 
Groups 
. 
AddToGroupAsync (
(( )
username) 1
,1 2
quizName3 ;
); <
;< =
await 
Clients 
. 
Caller  
.  !
JoinMessage! ,
(, -
username- 5
)5 6
;6 7
} 	
public   
async   
Task   
UpdateScore   %
(  % &
string  & ,
username  - 5
)  5 6
{!! 	
var"" 
user"" 
="" 
_userRepository"" &
.""& '
GetUser""' .
("". /
username""/ 7
)""7 8
;""8 9
if## 
(## 
user## 
!=## 
null## 
)## 
{$$ 
await%% 
Clients%% 
.%% 
Caller%% $
.%%$ %
UpdateScore%%% 0
(%%0 1
user%%1 5
.%%5 6
Score%%6 ;
)%%; <
;%%< =
}&& 
}'' 	
public** 
async** 
Task** 
ExitQuiz** "
(**" #
string**# )
username*** 2
,**2 3
string**4 :
quizName**; C
)**C D
{++ 	
_connections,, 
.,, 
Remove,, 
(,,  
username,,  (
,,,( )
Context,,* 1
.,,1 2
ConnectionId,,2 >
),,> ?
;,,? @
await.. 
Groups.. 
...  
RemoveFromGroupAsync.. -
(..- .
username... 6
,..6 7
quizName..8 @
)..@ A
;..A B
}// 	
}00 
}11 �$
@C:\Projects\HQTrivia\server\HQTrivia\Mapper\ConnectionMapping.cs
	namespace 	
HQTrivia
 
. 
Mapper 
{ 
public 

class 
ConnectionMapping "
<" #
T# $
>$ %
{ 
private 
readonly 

Dictionary #
<# $
T$ %
,% &
HashSet' .
<. /
string/ 5
>5 6
>6 7
_connections8 D
=E F
new 

Dictionary 
< 
T 
, 
HashSet %
<% &
string& ,
>, -
>- .
(. /
)/ 0
;0 1
public 

Dictionary 
< 
T 
, 
HashSet $
<$ %
string% +
>+ ,
>, -
GetUsers. 6
{		 	
get

 
{ 
return 
_connections #
;# $
} 
} 	
public 
int 
Count 
{ 	
get 
{ 
return 
_connections #
.# $
Count$ )
;) *
} 
} 	
public 
void 
Add 
( 
T 
key 
, 
string %
connectionId& 2
)2 3
{ 	
lock 
( 
_connections 
) 
{ 
HashSet 
< 
string 
> 
connections  +
;+ ,
if 
( 
! 
_connections !
.! "
TryGetValue" -
(- .
key. 1
,1 2
out3 6
connections7 B
)B C
)C D
{ 
connections 
=  !
new" %
HashSet& -
<- .
string. 4
>4 5
(5 6
)6 7
;7 8
_connections    
.    !
Add  ! $
(  $ %
key  % (
,  ( )
connections  * 5
)  5 6
;  6 7
}!! 
lock## 
(## 
connections## !
)##! "
{$$ 
connections%% 
.%%  
Add%%  #
(%%# $
connectionId%%$ 0
)%%0 1
;%%1 2
}&& 
}'' 
}(( 	
public** 
IEnumerable** 
<** 
string** !
>**! "
GetConnections**# 1
(**1 2
T**2 3
key**4 7
)**7 8
{++ 	
HashSet,, 
<,, 
string,, 
>,, 
connections,, '
;,,' (
if-- 
(-- 
_connections-- 
.-- 
TryGetValue-- (
(--( )
key--) ,
,--, -
out--. 1
connections--2 =
)--= >
)--> ?
{.. 
return// 
connections// "
;//" #
}00 
return22 

Enumerable22 
.22 
Empty22 #
<22# $
string22$ *
>22* +
(22+ ,
)22, -
;22- .
}33 	
public55 
void55 
Remove55 
(55 
T55 
key55  
,55  !
string55" (
connectionId55) 5
)555 6
{66 	
lock77 
(77 
_connections77 
)77 
{88 
HashSet99 
<99 
string99 
>99 
connections99  +
;99+ ,
if:: 
(:: 
!:: 
_connections:: !
.::! "
TryGetValue::" -
(::- .
key::. 1
,::1 2
out::3 6
connections::7 B
)::B C
)::C D
{;; 
return<< 
;<< 
}== 
lock?? 
(?? 
connections?? !
)??! "
{@@ 
connectionsAA 
.AA  
RemoveAA  &
(AA& '
connectionIdAA' 3
)AA3 4
;AA4 5
ifCC 
(CC 
connectionsCC #
.CC# $
CountCC$ )
==CC* ,
$numCC- .
)CC. /
{DD 
_connectionsEE $
.EE$ %
RemoveEE% +
(EE+ ,
keyEE, /
)EE/ 0
;EE0 1
}FF 
}GG 
}HH 
}II 	
}JJ 
}KK �
=C:\Projects\HQTrivia\server\HQTrivia\Mapper\MappingProfile.cs
	namespace 	
HQTrivia
 
. 
Mapper 
{ 
public 

class 
MappingProfile 
:  !
Profile" )
{ 
public		 
MappingProfile		 
(		 
)		 
{

 	
	CreateMap 
< 
Quiz 
, 
QuizDTO #
># $
($ %
)% &
;& '
	CreateMap 
< 
Question 
, 
QuestionDTO  +
>+ ,
(, -
)- .
;. /
	CreateMap 
< 
Answer 
, 
	AnswerDTO '
>' (
(( )
)) *
;* +
} 	
} 
} �2
/C:\Projects\HQTrivia\server\HQTrivia\Program.cs
var 
builder 
= 
WebApplication 
. 
CreateBuilder *
(* +
args+ /
)/ 0
;0 1
builder 
. 
Services 
. 
AddDbContext 
<  
ApplicationDbContext 2
>2 3
(3 4
options4 ;
=>< >
{ 
options 
. 
UseSqlServer 
( 
builder 
. 
Configuration 
. 
GetConnectionString 1
(1 2
$str2 E
)E F
) 
; 
options 
. &
EnableSensitiveDataLogging &
(& '
)' (
;( )
} 
) 
; 
builder 
. 
Services 
. 

AddSignalR 
( 
) 
; 
var 
mapperConfig 
= 
new 
MapperConfiguration *
(* +
mc+ -
=>. 0
{ 
mc   
.   

AddProfile   
(   
new   
MappingProfile   $
(  $ %
)  % &
)  & '
;  ' (
}!! 
)!! 
;!! 
IMapper## 
mapper## 
=## 
mapperConfig## 
.## 
CreateMapper## *
(##* +
)##+ ,
;##, -
builder$$ 
.$$ 
Services$$ 
.$$ 
AddSingleton$$ 
($$ 
mapper$$ $
)$$$ %
;$$% &
builder'' 
.'' 
Services'' 
.'' 
AddControllers'' 
(''  
)''  !
.''! "
AddNewtonsoftJson''" 3
(''3 4
)''4 5
;''5 6
builder)) 
.)) 
Services)) 
.)) 
	AddScoped)) 
<)) 
IUserService)) '
,))' (
UserService))) 4
>))4 5
())5 6
)))6 7
;))7 8
builder** 
.** 
Services** 
.** 
	AddScoped** 
<** 
IUserRepository** *
,*** +
UserRepository**, :
>**: ;
(**; <
)**< =
;**= >
builder++ 
.++ 
Services++ 
.++ 
	AddScoped++ 
<++ 
IQuizService++ '
,++' (
QuizService++) 4
>++4 5
(++5 6
)++6 7
;++7 8
builder,, 
.,, 
Services,, 
.,, 
	AddScoped,, 
<,, 
IQuizRepository,, *
,,,* +
QuizRepository,,, :
>,,: ;
(,,; <
),,< =
;,,= >
builder-- 
.-- 
Services-- 
.-- 
	AddScoped-- 
<-- 
IQuestionRepository-- .
,--. /
QuestionRepository--0 B
>--B C
(--C D
)--D E
;--E F
builder.. 
... 
Services.. 
... 
	AddScoped.. 
<.. 
IQuestionService.. +
,..+ ,
QuestionService..- <
>..< =
(..= >
)..> ?
;..? @
builder// 
.// 
Services// 
.// 
	AddScoped// 
<// 
IAnswerRepository// ,
,//, -
AnswerRepository//. >
>//> ?
(//? @
)//@ A
;//A B
builder00 
.00 
Services00 
.00 
	AddScoped00 
<00 
IAnswerService00 )
,00) *
AnswerService00+ 8
>008 9
(009 :
)00: ;
;00; <
builder22 
.22 
Services22 
.22 
AddCors22 
(22 
options22  
=>22! #
{33 
options44 
.44 
AddDefaultPolicy44 
(44 
builder44 $
=>44% '
{55 
builder66 
.66 
WithOrigins66 
(66 
$str66 3
)663 4
.77 	
AllowAnyHeader77	 
(77 
)77 
.88 	
AllowAnyMethod88	 
(88 
)88 
.99 	
AllowCredentials99	 
(99 
)99 
;99 
}:: 
):: 
;:: 
};; 
);; 
;;; 
builder== 
.== 
Services== 
.== #
AddEndpointsApiExplorer== (
(==( )
)==) *
;==* +
builder>> 
.>> 
Services>> 
.>> 
AddSwaggerGen>> 
(>> 
)>>  
;>>  !
var@@ 
app@@ 
=@@ 	
builder@@
 
.@@ 
Build@@ 
(@@ 
)@@ 
;@@ 
ifCC 
(CC 
appCC 
.CC 
EnvironmentCC 
.CC 
IsDevelopmentCC !
(CC! "
)CC" #
)CC# $
{DD 
appEE 
.EE 

UseSwaggerEE 
(EE 
)EE 
;EE 
appFF 
.FF 
UseSwaggerUIFF 
(FF 
)FF 
;FF 
}GG 
appII 
.II 
UseHttpsRedirectionII 
(II 
)II 
;II 
appJJ 
.JJ 

UseRoutingJJ 
(JJ 
)JJ 
;JJ 
appKK 
.KK 
UseCorsKK 
(KK 
)KK 
;KK 
appMM 
.MM 
UseAuthorizationMM 
(MM 
)MM 
;MM 
appOO 
.OO 
UseEndpointsOO 
(OO 
	endpointsOO 
=>OO 
{PP 
	endpointsQQ 
.QQ 
MapControllersQQ 
(QQ 
)QQ 
;QQ 
	endpointsRR 
.RR 
MapHubRR 
<RR 
QuizHubRR 
>RR 
(RR 
$strRR )
)RR) *
;RR* +
}SS 
)SS 
;SS 
appUU 
.UU 
MapControllersUU 
(UU 
)UU 
;UU 
appWW 
.WW 
RunWW 
(WW 
)WW 	
;WW	 
�
=C:\Projects\HQTrivia\server\HQTrivia\Service\AnswerService.cs
	namespace

 	
HQTrivia


 
.

 
Service

 
{ 
public 

class 
AnswerService 
:  
IAnswerService! /
{ 
private 
readonly 
IAnswerRepository *
_answerRepository+ <
;< =
public 
AnswerService 
(  
ApplicationDbContext 1
_db2 5
)5 6
{ 	
_answerRepository 
= 
new  #
AnswerRepository$ 4
(4 5
_db5 8
)8 9
;9 :
} 	
public 
Answer 
? 
	GetAnswer  
(  !
int! $
answerId% -
)- .
{ 	
if 
( 
answerId 
<= 
$num 
) 
{ 
throw 
new 
InvalidIdException ,
(, -
)- .
;. /
} 
var 
answer 
= 
_answerRepository *
.* +
	GetAnswer+ 4
(4 5
answerId5 =
)= >
;> ?
if 
( 
answer 
== 
null 
) 
{ 
throw 
new #
AnswerNotFoundException 1
(1 2
)2 3
;3 4
} 
return 
answer 
; 
}   	
public"" 
void"" 
RemoveAnswer""  
(""  !
int""! $
answerId""% -
)""- .
{## 	
if$$ 
($$ 
answerId$$ 
<=$$ 
$num$$ 
)$$ 
{%% 
throw&& 
new&& 
InvalidIdException&& ,
(&&, -
)&&- .
;&&. /
}'' 
_answerRepository(( 
.(( 
RemoveAnswer(( *
(((* +
answerId((+ 3
)((3 4
;((4 5
})) 	
}** 
}++ �
GC:\Projects\HQTrivia\server\HQTrivia\Service\IService\IAnswerService.cs
	namespace 	
HQTrivia
 
. 
Service 
. 
IService #
{ 
public 

	interface 
IAnswerService #
{ 
Answer		 
?		 
	GetAnswer		 
(		 
int		 
id		  
)		  !
;		! "
void 
RemoveAnswer 
( 
int 
id  
)  !
;! "
} 
} �

IC:\Projects\HQTrivia\server\HQTrivia\Service\IService\IQuestionService.cs
	namespace 	
HQTrivia
 
. 
Service 
. 
IService #
{ 
public 

	interface 
IQuestionService %
{ 
IEnumerable 
< 
Question 
> 
GetAllQuestions -
(- .
). /
;/ 0
Question		 
?		 
GetQuestion		 
(		 
int		 !
id		" $
)		$ %
;		% &
void

 
Remove

 
(

 
int

 
id

 
)

 
;

 
void 
Update 
( 
int 

questionId "
," #
Question$ ,
question- 5
)5 6
;6 7
void 
UpdatePartial 
( 
Question #
question$ ,
), -
;- .
void 
Add 
( 
Question 
question "
)" #
;# $
IEnumerable 
< 
Question 
> &
GetUnsentQuestionsFromQuiz 8
(8 9
int9 <
quizId= C
)C D
;D E
} 
} �
EC:\Projects\HQTrivia\server\HQTrivia\Service\IService\IQuizService.cs
	namespace 	
HQTrivia
 
. 
Service 
. 
IService #
{ 
public 

	interface 
IQuizService !
{ 
IEnumerable		 
<		 
Quiz		 
>		 
GetAllQuizzes		 '
(		' (
)		( )
;		) *
Quiz

 
?

 
GetQuiz

 
(

 
int

 
id

 
)

 
;

 
void 
Add 
( 
Quiz 
quiz 
) 
; 
void 
Remove 
( 
int 
id 
) 
; 
void 
UpdatePartial 
( 
Quiz 
quiz  $
)$ %
;% &
void 
Update 
( 
int 
quizId 
, 
Quiz  $
quiz% )
)) *
;* +
void 
AddQuestionToQuiz 
( 
int "

questionId# -
,- .
int/ 2
quizId3 9
)9 :
;: ;
void "
RemoveQuestionFromQuiz #
(# $
int$ '

questionId( 2
,2 3
int4 7
quizId8 >
)> ?
;? @
void 
Save 
( 
) 
; 
IEnumerable 
< 
Quiz 
> 
GetAllPastQuizzes +
(+ ,
), -
;- .
Status 
	ResetQuiz 
( 
Quiz 
? 
quiz #
)# $
;$ %
Status 
OpenQuiz 
( 
Quiz 
? 
quiz "
)" #
;# $
Status 
	StartQuiz 
( 
Quiz 
? 
quiz #
)# $
;$ %
Status 

FinishQuiz 
( 
Quiz 
? 
quiz  $
)$ %
;% &
Question 
SendQuestion 
( 
Quiz "
?" #
quiz$ (
,( )
int* -

questionId. 8
)8 9
;9 :
} 
} �
EC:\Projects\HQTrivia\server\HQTrivia\Service\IService\IUserService.cs
	namespace 	
HQTrivia
 
. 
Service 
. 
IService #
{ 
public 

	interface 
IUserService !
{ 
void 
HandleAnswer 
( 
string  
username! )
,) *
string+ 1
value2 7
)7 8
;8 9
IEnumerable 
< 
User 
> 
GetLeaderboard (
(( )
)) *
;* +
void		 

ResetUsers		 
(		 
)		 
;		 
}

 
} �F
?C:\Projects\HQTrivia\server\HQTrivia\Service\QuestionService.cs
	namespace

 	
HQTrivia


 
.

 
Service

 
{ 
public 

class 
QuestionService  
:! "
IQuestionService# 3
{ 
private 
readonly 
IQuestionRepository ,
_questionRepository- @
;@ A
private 
readonly 
IQuizRepository (
_quizRepository) 8
;8 9
public 
QuestionService 
(  
ApplicationDbContext 3
_db4 7
)7 8
{ 	
_questionRepository 
=  !
new" %
QuestionRepository& 8
(8 9
_db9 <
)< =
;= >
_quizRepository 
= 
new !
QuizRepository" 0
(0 1
_db1 4
)4 5
;5 6
} 	
public 
void 
Add 
( 
Question  
questionDto! ,
), -
{ 	
ValidateQuestion 
( 
questionDto (
)( )
;) *
List 
< 
Answer 
> 
Answers  
=! "
new# &
List' +
<+ ,
Answer, 2
>2 3
(3 4
)4 5
;5 6
foreach 
( 
var 
answer 
in  "
questionDto# .
.. /
Answers/ 6
)6 7
{ 
Answers 
. 
Add 
( 
new 
Answer  &
(& '
)' (
{ 
Text 
= 
answer !
.! "
Text" &
,& '
	IsCorrect 
= 
answer  &
.& '
	IsCorrect' 0
}   
)   
;   
}!! 
Question"" 
question"" 
="" 
new""  #
(""# $
)""$ %
{## 
Text$$ 
=$$ 
questionDto$$ "
.$$" #
Text$$# '
,$$' (
Answers%% 
=%% 
Answers%% !
,%%! "
Duration&& 
=&& 
questionDto&& &
.&&& '
Duration&&' /
,&&/ 0
QuizId'' 
='' 
questionDto'' $
.''$ %
QuizId''% +
}(( 
;(( 
_questionRepository)) 
.))  
Add))  #
())# $
question))$ ,
))), -
;))- .
}** 	
public,, 
IEnumerable,, 
<,, 
Question,, #
>,,# $
GetAllQuestions,,% 4
(,,4 5
),,5 6
{-- 	
return.. 
_questionRepository.. &
...& '
GetAllQuestions..' 6
(..6 7
)..7 8
;..8 9
}// 	
public11 
Question11 
?11 
GetQuestion11 $
(11$ %
int11% (

questionId11) 3
)113 4
{22 	
if33 
(33 

questionId33 
<=33 
$num33 
)33  
{44 
throw55 
new55 
InvalidIdException55 ,
(55, -
)55- .
;55. /
}66 
var77 
question77 
=77 
_questionRepository77 .
.77. /
GetQuestion77/ :
(77: ;

questionId77; E
)77E F
;77F G
if88 
(88 
question88 
==88 
null88  
)88  !
{99 
throw:: 
new:: %
QuestionNotFoundException:: 3
(::3 4
)::4 5
;::5 6
};; 
return<< 
question<< 
;<< 
}== 	
public?? 
IEnumerable?? 
<?? 
Question?? #
>??# $
???$ %&
GetUnsentQuestionsFromQuiz??& @
(??@ A
int??A D
quizId??E K
)??K L
{@@ 	
ifAA 
(AA 
quizIdAA 
<=AA 
$numAA 
)AA 
{BB 
throwCC 
newCC 
InvalidIdExceptionCC ,
(CC, -
)CC- .
;CC. /
}DD 
varEE 
quizEE 
=EE 
_quizRepositoryEE &
.EE& '
GetQuizEE' .
(EE. /
quizIdEE/ 5
)EE5 6
;EE6 7
ifFF 
(FF 
quizFF 
==FF 
nullFF 
)FF 
{GG 
throwHH 
newHH !
QuizNotFoundExceptionHH /
(HH/ 0
)HH0 1
;HH1 2
}II 
returnJJ 
_questionRepositoryJJ &
.JJ& '&
GetUnsentQuestionsFromQuizJJ' A
(JJA B
quizIdJJB H
)JJH I
;JJI J
}KK 	
publicMM 
voidMM 
RemoveMM 
(MM 
intMM 

questionIdMM )
)MM) *
{NN 	
varOO 
questionOO 
=OO 
GetQuestionOO &
(OO& '

questionIdOO' 1
)OO1 2
;OO2 3
_questionRepositoryPP 
.PP  
RemovePP  &
(PP& '
questionPP' /
)PP/ 0
;PP0 1
}QQ 	
publicSS 
voidSS 
UpdateSS 
(SS 
intSS 

questionIdSS )
,SS) *
QuestionSS+ 3
questionSS4 <
)SS< =
{TT 	
ValidateQuestionUU 
(UU 
questionUU %
)UU% &
;UU& '
QuestionWW 
questionToUpdateWW %
=WW& '
newWW( +
(WW+ ,
)WW, -
{XX 
IdYY 
=YY 

questionIdYY 
,YY  
TextZZ 
=ZZ 
questionZZ 
.ZZ  
TextZZ  $
,ZZ$ %
Duration[[ 
=[[ 
question[[ #
.[[# $
Duration[[$ ,
,[[, -
IsSent\\ 
=\\ 
question\\ !
.\\! "
IsSent\\" (
,\\( )
Answers]] 
=]] 
question]] "
.]]" #
Answers]]# *
,]]* +
QuizId^^ 
=^^ 
question^^ !
.^^! "
QuizId^^" (
}__ 
;__ 
_questionRepositoryaa 
.aa  
Updateaa  &
(aa& '
questionToUpdateaa' 7
)aa7 8
;aa8 9
}bb 	
publicdd 
voiddd 
UpdatePartialdd !
(dd! "
Questiondd" *
questiondd+ 3
)dd3 4
{ee 	
_questionRepositoryff 
.ff  
Updateff  &
(ff& '
questionff' /
)ff/ 0
;ff0 1
}gg 	
publicii 
voidii 
ValidateQuestionii $
(ii$ %
Questionii% -!
questionForValidationii. C
)iiC D
{jj 	
varkk 
questionListkk 
=kk 
_questionRepositorykk 2
.kk2 3
GetAllQuestionskk3 B
(kkB C
)kkC D
;kkD E
ifll 
(ll !
questionForValidationll %
.ll% &
Textll& *
.ll* +
Lengthll+ 1
==ll2 4
$numll5 6
)ll6 7
{mm 
thrownn 
newnn &
QuestionTextEmptyExceptionnn 4
(nn4 5
)nn5 6
;nn6 7
}oo 
ifpp 
(pp !
questionForValidationpp %
.pp% &
Answerspp& -
.pp- .
Countpp. 3
(pp3 4
qpp4 5
=>pp6 8
qpp9 :
.pp: ;
	IsCorrectpp; D
==ppE G
trueppH L
)ppL M
>ppN O
$numppP Q
)ppQ R
{qq 
throwrr 
newrr .
"MultipleAnswersAreCorrectExceptionrr <
(rr< =
)rr= >
;rr> ?
}ss 
iftt 
(tt !
questionForValidationtt %
.tt% &
Answerstt& -
.tt- .
Counttt. 3
(tt3 4
qtt4 5
=>tt6 8
qtt9 :
.tt: ;
	IsCorrecttt; D
==ttE G
truettH L
)ttL M
==ttN P
$numttQ R
)ttR S
{uu 
throwvv 
newvv +
OneAnswerMustBeCorrectExceptionvv 9
(vv9 :
)vv: ;
;vv; <
}ww 
ifxx 
(xx !
questionForValidationxx %
.xx% &
Durationxx& .
<=xx/ 1
$numxx2 3
)xx3 4
{yy 
throwzz 
newzz %
DurationNotValidExceptionzz 3
(zz3 4
)zz4 5
;zz5 6
}{{ 
}|| 	
}}} 
}~~ �k
;C:\Projects\HQTrivia\server\HQTrivia\Service\QuizService.cs
	namespace 	
HQTrivia
 
. 
Service 
{ 
public 

class 
QuizService 
: 
IQuizService +
{ 
private 
readonly 
IQuizRepository (
_quizRepository) 8
;8 9
public 
QuizService 
(  
ApplicationDbContext /
_db0 3
)3 4
{ 	
_quizRepository 
= 
new !
QuizRepository" 0
(0 1
_db1 4
)4 5
;5 6
} 	
public 
void 
Add 
( 
Quiz 
quizDto $
)$ %
{ 	
ValidateQuiz 
( 
quizDto  
)  !
;! "
Quiz 
quiz 
= 
new 
( 
) 
{ 
Name 
= 
quizDto 
. 
Name #
,# $
StartingDateTime  
=! "
quizDto# *
.* +
StartingDateTime+ ;
,; <
CreatedDateTime 
=  !
DateTime" *
.* +
Now+ .
,. /
Prize 
= 
quizDto 
.  
Prize  %
,% &
CurrencyType 
= 
quizDto &
.& '
CurrencyType' 3
,3 4
	Questions   
=   
quizDto   #
.  # $
	Questions  $ -
,  - .
ThumbNailURL!! 
=!! 
quizDto!! &
.!!& '
ThumbNailURL!!' 3
}"" 
;"" 
_quizRepository## 
.## 
Add## 
(##  
quiz##  $
)##$ %
;##% &
}$$ 	
public&& 
IEnumerable&& 
<&& 
Quiz&& 
>&&  
GetAllQuizzes&&! .
(&&. /
)&&/ 0
{'' 	
return(( 
_quizRepository(( "
.((" #
GetAllQuizzes((# 0
(((0 1
)((1 2
;((2 3
})) 	
public++ 
Quiz++ 
?++ 
GetQuiz++ 
(++ 
int++  
id++! #
)++# $
{,, 	
if-- 
(-- 
id-- 
<=-- 
$num-- 
)-- 
{.. 
throw// 
new// 
InvalidIdException// ,
(//, -
)//- .
;//. /
}00 
var11 
quiz11 
=11 
_quizRepository11 &
.11& '
GetQuiz11' .
(11. /
id11/ 1
)111 2
;112 3
if22 
(22 
quiz22 
==22 
null22 
)22 
{33 
throw44 
new44 !
QuizNotFoundException44 /
(44/ 0
)440 1
;441 2
}55 
return66 
quiz66 
;66 
}77 	
public99 
void99 
Remove99 
(99 
int99 
id99 !
)99! "
{:: 	
var;; 
quiz;; 
=;; 
GetQuiz;; 
(;; 
id;; !
);;! "
;;;" #
_quizRepository<< 
.<< 
Remove<< "
(<<" #
quiz<<# '
)<<' (
;<<( )
}== 	
public>> 
void>> 
Update>> 
(>> 
int>> 
quizId>> %
,>>% &
Quiz>>' +
quiz>>, 0
)>>0 1
{?? 	
ValidateQuiz@@ 
(@@ 
quiz@@ 
)@@ 
;@@ 
QuizBB 
quizToUpdateBB 
=BB 
newBB  #
(BB# $
)BB$ %
{CC 
IdDD 
=DD 
quizIdDD 
,DD 
NameEE 
=EE 
quizEE 
.EE 
NameEE  
,EE  !
PrizeFF 
=FF 
quizFF 
.FF 
PrizeFF "
,FF" #
CurrencyTypeGG 
=GG 
quizGG #
.GG# $
CurrencyTypeGG$ 0
,GG0 1
StatusHH 
=HH 
quizHH 
.HH 
StatusHH $
,HH$ %
StartingDateTimeII  
=II! "
quizII# '
.II' (
StartingDateTimeII( 8
,II8 9
CreatedDateTimeJJ 
=JJ  !
quizJJ" &
.JJ& '
CreatedDateTimeJJ' 6
,JJ6 7
	QuestionsKK 
=KK 
quizKK  
.KK  !
	QuestionsKK! *
,KK* +
ThumbNailURLLL 
=LL 
quizLL #
.LL# $
ThumbNailURLLL$ 0
}MM 
;MM 
_quizRepositoryOO 
.OO 
UpdateOO "
(OO" #
quizToUpdateOO# /
)OO/ 0
;OO0 1
}PP 	
publicQQ 
voidQQ 
UpdatePartialQQ !
(QQ! "
QuizQQ" &
quizQQ' +
)QQ+ ,
{RR 	
_quizRepositorySS 
.SS 
UpdateSS "
(SS" #
quizSS# '
)SS' (
;SS( )
}TT 	
publicVV 
voidVV 
AddQuestionToQuizVV %
(VV% &
intVV& )

questionIdVV* 4
,VV4 5
intVV6 9
quizIdVV: @
)VV@ A
{WW 	
ifXX 
(XX 

questionIdXX 
<=XX 
$numXX 
||XX !
quizIdXX" (
<=XX) +
$numXX, -
)XX- .
{YY 
throwZZ 
newZZ 
InvalidIdExceptionZZ ,
(ZZ, -
)ZZ- .
;ZZ. /
}[[ 
_quizRepository]] 
.]] 
	AddToQuiz]] %
(]]% &

questionId]]& 0
,]]0 1
quizId]]2 8
)]]8 9
;]]9 :
}^^ 	
public`` 
void`` "
RemoveQuestionFromQuiz`` *
(``* +
int``+ .

questionId``/ 9
,``9 :
int``; >
quizId``? E
)``E F
{aa 	
ifbb 
(bb 

questionIdbb 
<=bb 
$numbb 
||bb  "
quizIdbb# )
<=bb* ,
$numbb- .
)bb. /
{cc 
throwdd 
newdd 
InvalidIdExceptiondd ,
(dd, -
)dd- .
;dd. /
}ee 
_quizRepositorygg 
.gg 
RemoveFromQuizgg *
(gg* +

questionIdgg+ 5
,gg5 6
quizIdgg7 =
)gg= >
;gg> ?
}hh 	
publicjj 
voidjj 
Savejj 
(jj 
)jj 
{kk 	
_quizRepositoryll 
.ll 
Savell  
(ll  !
)ll! "
;ll" #
}mm 	
publicnn 
IEnumerablenn 
<nn 
Quiznn 
>nn  
GetAllPastQuizzesnn! 2
(nn2 3
)nn3 4
{oo 	
returnpp 
_quizRepositorypp "
.pp" #
GetAllPastQuizzespp# 4
(pp4 5
)pp5 6
;pp6 7
}qq 	
publicss 
voidss 
ValidateQuizss  
(ss  !
Quizss! %
quizDtoss& -
)ss- .
{tt 	
ifuu 
(uu 
quizDtouu 
.uu 
Nameuu 
.uu 
Lengthuu #
==uu$ &
$numuu' (
)uu( )
{vv 
throwww 
newww "
QuizNameEmptyExceptionww 0
(ww0 1
)ww1 2
;ww2 3
}xx 
ifyy 
(yy 
quizDtoyy 
.yy 
Nameyy 
.yy 
Lengthyy #
>yy$ %
$numyy& (
)yy( )
{zz 
throw{{ 
new{{ $
QuizNameTooLongException{{ 2
({{2 3
){{3 4
;{{4 5
}|| 
if}} 
(}} 
quizDto}} 
.}} 
StartingDateTime}} (
<=}}) +
DateTime}}, 4
.}}4 5
Now}}5 8
)}}8 9
{~~ 
throw 
new )
StartingDateNotValidException 7
(7 8
)8 9
;9 :
}
�� 
if
�� 
(
�� 
quizDto
�� 
.
�� 
Prize
�� 
<=
��  
$num
��! "
||
��# %
quizDto
��& -
.
��- .
CurrencyType
��. :
==
��; =
$str
��> @
)
��@ A
{
�� 
throw
�� 
new
�� $
PrizeNotValidException
�� 0
(
��0 1
)
��1 2
;
��2 3
}
�� 
}
�� 	
public
�� 
List
�� 
<
�� 
Question
�� 
>
�� 
ResetQuestions
�� ,
(
��, -
Quiz
��- 1
?
��1 2
quiz
��3 7
)
��7 8
{
�� 	
foreach
�� 
(
�� 
var
�� 
question
�� !
in
��" $
quiz
��% )
.
��) *
	Questions
��* 3
)
��3 4
{
�� 
question
�� 
.
�� 
IsSent
�� 
=
��  !
false
��" '
;
��' (
}
�� 
return
�� 
quiz
�� 
.
�� 
	Questions
�� !
;
��! "
}
�� 	
public
�� 
Status
�� 
	ResetQuiz
�� 
(
��  
Quiz
��  $
?
��$ %
quiz
��& *
)
��* +
{
�� 	
ResetQuestions
�� 
(
�� 
quiz
�� 
)
��  
;
��  !
quiz
�� 
.
�� 
Status
�� 
=
�� 
Status
��  
.
��  !
	SCHEDULED
��! *
;
��* +
_quizRepository
�� 
.
�� 
Save
��  
(
��  !
)
��! "
;
��" #
return
�� 
quiz
�� 
.
�� 
Status
�� 
;
�� 
}
�� 	
public
�� 
Status
�� 
OpenQuiz
�� 
(
�� 
Quiz
�� #
?
��# $
quiz
��% )
)
��) *
{
�� 	
quiz
�� 
.
�� 
Status
�� 
=
�� 
Status
��  
.
��  !
OPEN_FOR_JOINING
��! 1
;
��1 2
_quizRepository
�� 
.
�� 
Save
��  
(
��  !
)
��! "
;
��" #
return
�� 
quiz
�� 
.
�� 
Status
�� 
;
�� 
}
�� 	
public
�� 
Status
�� 
	StartQuiz
�� 
(
��  
Quiz
��  $
?
��$ %
quiz
��& *
)
��* +
{
�� 	
quiz
�� 
.
�� 
Status
�� 
=
�� 
Status
��  
.
��  !
IN_PROGRESS
��! ,
;
��, -
_quizRepository
�� 
.
�� 
Save
��  
(
��  !
)
��! "
;
��" #
return
�� 
quiz
�� 
.
�� 
Status
�� 
;
�� 
}
�� 	
public
�� 
Status
�� 

FinishQuiz
��  
(
��  !
Quiz
��! %
?
��% &
quiz
��' +
)
��+ ,
{
�� 	
ResetQuestions
�� 
(
�� 
quiz
�� 
)
��  
;
��  !
quiz
�� 
.
�� 
Status
�� 
=
�� 
Status
��  
.
��  !
FINISHED
��! )
;
��) *
_quizRepository
�� 
.
�� 
Save
��  
(
��  !
)
��! "
;
��" #
return
�� 
quiz
�� 
.
�� 
Status
�� 
;
�� 
}
�� 	
public
�� 
Question
�� 
SendQuestion
�� $
(
��$ %
Quiz
��% )
?
��) *
quiz
��+ /
,
��/ 0
int
��1 4

questionId
��5 ?
)
��? @
{
�� 	
if
�� 
(
�� 
quiz
�� 
.
�� 
Status
�� 
!=
�� 
Status
�� %
.
��% &
IN_PROGRESS
��& 1
)
��1 2
{
�� 
throw
�� 
new
�� (
QuizHasNotStartedException
�� 4
(
��4 5
)
��5 6
;
��6 7
}
�� 
var
�� 
question
�� 
=
�� 
quiz
�� 
.
��  
	Questions
��  )
.
��) *
FirstOrDefault
��* 8
(
��8 9
question
��9 A
=>
��B D
question
��E M
.
��M N
Id
��N P
==
��Q S

questionId
��T ^
)
��^ _
;
��_ `
if
�� 
(
�� 
question
�� 
==
�� 
null
��  
)
��  !
{
�� 
throw
�� 
new
�� -
QuestionNotFoundInQuizException
�� 9
(
��9 :
)
��: ;
;
��; <
}
�� 
question
�� 
.
�� 
IsSent
�� 
=
�� 
true
�� "
;
��" #
_quizRepository
�� 
.
�� 
Save
��  
(
��  !
)
��! "
;
��" #
return
�� 
question
�� 
;
�� 
}
�� 	
}
�� 
}�� �
;C:\Projects\HQTrivia\server\HQTrivia\Service\UserService.cs
	namespace 	
HQTrivia
 
. 
Service 
{ 
public		 

class		 
UserService		 
:		 
IUserService		 +
{

 
private 
readonly 
IUserRepository (
_userRepository) 8
;8 9
public 
UserService 
(  
IServiceScopeFactory /
factory0 7
)7 8
{ 	
_userRepository 
= 
new !
UserRepository" 0
(0 1
factory1 8
)8 9
;9 :
} 	
public 
void 
HandleAnswer  
(  !
string! '
username( 0
,0 1
string2 8
value9 >
)> ?
{ 	
User 
? 
user 
= 
_userRepository (
.( )
GetUser) 0
(0 1
username1 9
)9 :
;: ;
if 
( 
user 
== 
null 
) 
{ 
user 
= 
_userRepository &
.& '
AddUser' .
(. /
username/ 7
)7 8
;8 9
} 
if 
( 
value 
. 
Equals 
( 
$str #
)# $
)$ %
{ 
user 
. 
Score 
++ 
; 
_userRepository 
.  
UpdateUserScore  /
(/ 0
user0 4
)4 5
;5 6
} 
} 	
public 
IEnumerable 
< 
User 
>  
GetLeaderboard! /
(/ 0
)0 1
{   	
return!! 
_userRepository!! "
.!!" #
GetAllUsers!!# .
(!!. /
)!!/ 0
;!!0 1
}"" 	
public$$ 
void$$ 

ResetUsers$$ 
($$ 
)$$  
{%% 	
_userRepository&& 
.&& 

ResetUsers&& &
(&&& '
)&&' (
;&&( )
}'' 	
}(( 
})) 