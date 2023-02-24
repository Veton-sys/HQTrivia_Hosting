©
<C:\Projects\HQTrivia\server\HQTrivia.Models\Models\Answer.cs
	namespace 	
HQTrivia
 
. 
Models 
. 
Models  
{ 
public 

class 
Answer 
{ 
[		 	
Key			 
]		 
[

 	

JsonIgnore

	 
]

 
[ 	
DatabaseGenerated	 
( #
DatabaseGeneratedOption 2
.2 3
Identity3 ;
); <
]< =
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
[ 	
Required	 
] 
public 
string 
Text 
{ 
get  
;  !
set" %
;% &
}' (
[ 	
Required	 
] 
public 
bool 
	IsCorrect 
{ 
get  #
;# $
set% (
;( )
}* +
[ 	

JsonIgnore	 
] 
public 
int 

QuestionId 
{ 
get  #
;# $
set% (
;( )
}* +
[ 	

ForeignKey	 
( 
$str  
)  !
]! "
[ 	
	NotMapped	 
] 
[ 	

JsonIgnore	 
] 
public 
Question 
? 
Question !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
} ÿ
DC:\Projects\HQTrivia\server\HQTrivia.Models\Models\Dtos\AnswerDTO.cs
	namespace 	
HQTrivia
 
. 
Models 
. 
Models  
.  !
Dtos! %
{ 
public 

class 
	AnswerDTO 
{ 
[ 	
Required	 
] 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
[		 	
Required			 
]		 
public

 
int

 

QuestionId

 
{

 
get

  #
;

# $
set

% (
;

( )
}

* +
[ 	
Required	 
] 
public 
string 
Text 
{ 
get  
;  !
set" %
;% &
}' (
[ 	
Required	 
] 
public 
bool 
	IsCorrect 
{ 
get  #
;# $
set% (
;( )
}* +
} 
} »
FC:\Projects\HQTrivia\server\HQTrivia.Models\Models\Dtos\QuestionDTO.cs
	namespace		 	
HQTrivia		
 
.		 
Models		 
.		 
Models		  
.		  !
Dtos		! %
{

 
public 

class 
QuestionDTO 
{ 
[ 	
Required	 
] 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
[ 	
Required	 
] 
public 
string 
Text 
{ 
get  
;  !
set" %
;% &
}' (
public 
List 
< 
	AnswerDTO 
> 
? 
Answers  '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public 
int 
QuizId 
{ 
get 
;  
set! $
;$ %
}& '
public 
int 
Duration 
{ 
get !
;! "
set# &
;& '
}( )
public 
bool 
IsSent 
{ 
get  
;  !
set" %
;% &
}' (
=) *
false+ 0
;0 1
} 
} Ú
BC:\Projects\HQTrivia\server\HQTrivia.Models\Models\Dtos\QuizDTO.cs
	namespace

 	
HQTrivia


 
.

 
Models

 
.

 
Models

  
.

  !
Dtos

! %
{ 
public 

class 
QuizDTO 
{ 
[ 	
Required	 
] 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
[ 	
Required	 
] 
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
[ 	
Required	 
] 
public 
DateTime 
StartingDateTime (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
[ 	
Required	 
] 
public 
double 
Prize 
{ 
get !
;! "
set# &
;& '
}( )
[ 	
Required	 
] 
public 
string 
CurrencyType "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
Status 
Status 
{ 
get "
;" #
set$ '
;' (
}) *
=+ ,
Status- 3
.3 4
	SCHEDULED4 =
;= >
public 
List 
< 
QuestionDTO 
>  
?  !
	Questions" +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
public 
string 
? 
ThumbNailURL #
{$ %
get& )
;) *
set+ .
;. /
}0 1
} 
} §
XC:\Projects\HQTrivia\server\HQTrivia.Models\Models\Exceptions\AnswerNotFoundException.cs
	namespace 	
HQTrivia
 
. 
Models 
. 
Models  
.  !

Exceptions! +
{ 
[ 
Serializable 
] 
public 

class #
AnswerNotFoundException (
:) *
	Exception+ 4
{ 
public #
AnswerNotFoundException &
(& '
)' (
{		 	
}

 	
public #
AnswerNotFoundException &
(& '
string' -
?- .
message/ 6
)6 7
:8 9
base: >
(> ?
message? F
)F G
{ 	
} 	
public #
AnswerNotFoundException &
(& '
string' -
?- .
message/ 6
,6 7
	Exception8 A
?A B
innerExceptionC Q
)Q R
:S T
baseU Y
(Y Z
messageZ a
,a b
innerExceptionc q
)q r
{ 	
} 	
	protected #
AnswerNotFoundException )
() *
SerializationInfo* ;
info< @
,@ A
StreamingContextB R
contextS Z
)Z [
:\ ]
base^ b
(b c
infoc g
,g h
contexti p
)p q
{ 	
} 	
} 
} •
UC:\Projects\HQTrivia\server\HQTrivia.Models\Models\Exceptions\DuplicateIdException.cs
	namespace 	
HQTrivia
 
. 
Models 
. 
Models  
.  !

Exceptions! +
{ 
[ 
Serializable 
] 
public 

class  
DuplicateIdException %
:& '
	Exception( 1
{ 
public  
DuplicateIdException #
(# $
)$ %
{		 	
}

 	
public  
DuplicateIdException #
(# $
string$ *
?* +
message, 3
)3 4
:5 6
base7 ;
(; <
message< C
)C D
{ 	
} 	
public  
DuplicateIdException #
(# $
string$ *
?* +
message, 3
,3 4
	Exception5 >
?> ?
innerException@ N
)N O
:P Q
baseR V
(V W
messageW ^
,^ _
innerException` n
)n o
{ 	
} 	
	protected  
DuplicateIdException &
(& '
SerializationInfo' 8
info9 =
,= >
StreamingContext? O
contextP W
)W X
:Y Z
base[ _
(_ `
info` d
,d e
contextf m
)m n
{ 	
} 	
} 
} Ñ
_C:\Projects\HQTrivia\server\HQTrivia.Models\Models\Exceptions\DuplicateQuestionTextException.cs
	namespace 	
HQTrivia
 
. 
Models 
. 
Models  
.  !

Exceptions! +
{ 
[ 
Serializable 
] 
public 

class *
DuplicateQuestionTextException /
:0 1
	Exception2 ;
{ 
public *
DuplicateQuestionTextException -
(- .
). /
{		 	
}

 	
public *
DuplicateQuestionTextException -
(- .
string. 4
?4 5
message6 =
)= >
:? @
baseA E
(E F
messageF M
)M N
{ 	
} 	
public *
DuplicateQuestionTextException -
(- .
string. 4
?4 5
message6 =
,= >
	Exception? H
?H I
innerExceptionJ X
)X Y
:Z [
base\ `
(` a
messagea h
,h i
innerExceptionj x
)x y
{ 	
} 	
	protected *
DuplicateQuestionTextException 0
(0 1
SerializationInfo1 B
infoC G
,G H
StreamingContextI Y
contextZ a
)a b
:c d
basee i
(i j
infoj n
,n o
contextp w
)w x
{ 	
} 	
} 
} ê
ZC:\Projects\HQTrivia\server\HQTrivia.Models\Models\Exceptions\DurationNotValidException.cs
	namespace 	
HQTrivia
 
. 
Service 
{ 
[ 
Serializable 
] 
public 

class %
DurationNotValidException *
:+ ,
	Exception- 6
{ 
public %
DurationNotValidException (
(( )
)) *
{		 	
}

 	
public %
DurationNotValidException (
(( )
string) /
?/ 0
message1 8
)8 9
:: ;
base< @
(@ A
messageA H
)H I
{ 	
} 	
public %
DurationNotValidException (
(( )
string) /
?/ 0
message1 8
,8 9
	Exception: C
?C D
innerExceptionE S
)S T
:U V
baseW [
([ \
message\ c
,c d
innerExceptione s
)s t
{ 	
} 	
	protected %
DurationNotValidException +
(+ ,
SerializationInfo, =
info> B
,B C
StreamingContextD T
contextU \
)\ ]
:^ _
base` d
(d e
infoe i
,i j
contextk r
)r s
{ 	
} 	
} 
} ‰
SC:\Projects\HQTrivia\server\HQTrivia.Models\Models\Exceptions\InvalidIdException.cs
	namespace 	
HQTrivia
 
. 
Models 
. 
Models  
.  !

Exceptions! +
{ 
[ 
Serializable 
] 
public 

class 
InvalidIdException #
:$ %
	Exception& /
{ 
public 
InvalidIdException !
(! "
)" #
{		 	
}

 	
public 
InvalidIdException !
(! "
string" (
?( )
message* 1
)1 2
:3 4
base5 9
(9 :
message: A
)A B
{ 	
} 	
public 
InvalidIdException !
(! "
string" (
?( )
message* 1
,1 2
	Exception3 <
?< =
innerException> L
)L M
:N O
baseP T
(T U
messageU \
,\ ]
innerException^ l
)l m
{ 	
} 	
	protected 
InvalidIdException $
($ %
SerializationInfo% 6
info7 ;
,; <
StreamingContext= M
contextN U
)U V
:W X
baseY ]
(] ^
info^ b
,b c
contextd k
)k l
{ 	
} 	
} 
} é
cC:\Projects\HQTrivia\server\HQTrivia.Models\Models\Exceptions\MultipleAnswersAreCorrectException.cs
	namespace 	
HQTrivia
 
. 
Models 
. 
Models  
.  !

Exceptions! +
{ 
[ 
Serializable 
] 
public 

class .
"MultipleAnswersAreCorrectException 3
:4 5
	Exception6 ?
{ 
public .
"MultipleAnswersAreCorrectException 1
(1 2
)2 3
{		 	
}

 	
public .
"MultipleAnswersAreCorrectException 1
(1 2
string2 8
?8 9
message: A
)A B
:C D
baseE I
(I J
messageJ Q
)Q R
{ 	
} 	
public .
"MultipleAnswersAreCorrectException 1
(1 2
string2 8
?8 9
message: A
,A B
	ExceptionC L
?L M
innerExceptionN \
)\ ]
:^ _
base` d
(d e
messagee l
,l m
innerExceptionn |
)| }
{ 	
} 	
	protected .
"MultipleAnswersAreCorrectException 4
(4 5
SerializationInfo5 F
infoG K
,K L
StreamingContextM ]
context^ e
)e f
:g h
basei m
(m n
infon r
,r s
contextt {
){ |
{ 	
} 	
} 
} ×
`C:\Projects\HQTrivia\server\HQTrivia.Models\Models\Exceptions\OneAnswerMustBeCorrectException.cs
	namespace 	
HQTrivia
 
. 
Models 
. 
Models  
.  !

Exceptions! +
{ 
[ 
Serializable 
] 
public 

class +
OneAnswerMustBeCorrectException 0
:1 2
	Exception3 <
{ 
public +
OneAnswerMustBeCorrectException .
(. /
)/ 0
{		 	
}

 	
public +
OneAnswerMustBeCorrectException .
(. /
string/ 5
?5 6
message7 >
)> ?
:@ A
baseB F
(F G
messageG N
)N O
{ 	
} 	
public +
OneAnswerMustBeCorrectException .
(. /
string/ 5
?5 6
message7 >
,> ?
	Exception@ I
?I J
innerExceptionK Y
)Y Z
:[ \
base] a
(a b
messageb i
,i j
innerExceptionk y
)y z
{ 	
} 	
	protected +
OneAnswerMustBeCorrectException 1
(1 2
SerializationInfo2 C
infoD H
,H I
StreamingContextJ Z
context[ b
)b c
:d e
basef j
(j k
infok o
,o p
contextq x
)x y
{ 	
} 	
} 
} ¡
WC:\Projects\HQTrivia\server\HQTrivia.Models\Models\Exceptions\PrizeNotValidException.cs
	namespace 	
HQTrivia
 
. 
Models 
. 
Models  
.  !

Exceptions! +
{ 
[ 
Serializable 
] 
public 

class "
PrizeNotValidException '
:( )
	Exception* 3
{ 
public "
PrizeNotValidException %
(% &
)& '
{		 	
}

 	
public "
PrizeNotValidException %
(% &
string& ,
?, -
message. 5
)5 6
:7 8
base9 =
(= >
message> E
)E F
{ 	
} 	
public "
PrizeNotValidException %
(% &
string& ,
?, -
message. 5
,5 6
	Exception7 @
?@ A
innerExceptionB P
)P Q
:R S
baseT X
(X Y
messageY `
,` a
innerExceptionb p
)p q
{ 	
} 	
	protected "
PrizeNotValidException (
(( )
SerializationInfo) :
info; ?
,? @
StreamingContextA Q
contextR Y
)Y Z
:[ \
base] a
(a b
infob f
,f g
contexth o
)o p
{ 	
} 	
} 
} ³
ZC:\Projects\HQTrivia\server\HQTrivia.Models\Models\Exceptions\QuestionNotFoundException.cs
	namespace 	
HQTrivia
 
. 
Models 
. 
Models  
.  !

Exceptions! +
{ 
[ 
Serializable 
] 
public 

class %
QuestionNotFoundException *
:+ ,
	Exception- 6
{ 
public %
QuestionNotFoundException (
(( )
)) *
{		 	
}

 	
public %
QuestionNotFoundException (
(( )
string) /
?/ 0
message1 8
)8 9
:: ;
base< @
(@ A
messageA H
)H I
{ 	
} 	
public %
QuestionNotFoundException (
(( )
string) /
?/ 0
message1 8
,8 9
	Exception: C
?C D
innerExceptionE S
)S T
:U V
baseW [
([ \
message\ c
,c d
innerExceptione s
)s t
{ 	
} 	
	protected %
QuestionNotFoundException +
(+ ,
SerializationInfo, =
info> B
,B C
StreamingContextD T
contextU \
)\ ]
:^ _
base` d
(d e
infoe i
,i j
contextk r
)r s
{ 	
} 	
} 
} ×
`C:\Projects\HQTrivia\server\HQTrivia.Models\Models\Exceptions\QuestionNotFoundInQuizException.cs
	namespace 	
HQTrivia
 
. 
Models 
. 
Models  
.  !

Exceptions! +
{ 
[ 
Serializable 
] 
public 

class +
QuestionNotFoundInQuizException 0
:1 2
	Exception3 <
{ 
public +
QuestionNotFoundInQuizException .
(. /
)/ 0
{		 	
}

 	
public +
QuestionNotFoundInQuizException .
(. /
string/ 5
?5 6
message7 >
)> ?
:@ A
baseB F
(F G
messageG N
)N O
{ 	
} 	
public +
QuestionNotFoundInQuizException .
(. /
string/ 5
?5 6
message7 >
,> ?
	Exception@ I
?I J
innerExceptionK Y
)Y Z
:[ \
base] a
(a b
messageb i
,i j
innerExceptionk y
)y z
{ 	
} 	
	protected +
QuestionNotFoundInQuizException 1
(1 2
SerializationInfo2 C
infoD H
,H I
StreamingContextJ Z
context[ b
)b c
:d e
basef j
(j k
infok o
,o p
contextq x
)x y
{ 	
} 	
} 
} ¹
[C:\Projects\HQTrivia\server\HQTrivia.Models\Models\Exceptions\QuestionTextEmptyException.cs
	namespace 	
HQTrivia
 
. 
Models 
. 
Models  
.  !

Exceptions! +
{ 
[ 
Serializable 
] 
public 

class &
QuestionTextEmptyException +
:, -
	Exception. 7
{ 
public &
QuestionTextEmptyException )
() *
)* +
{		 	
}

 	
public &
QuestionTextEmptyException )
() *
string* 0
?0 1
message2 9
)9 :
:; <
base= A
(A B
messageB I
)I J
{ 	
} 	
public &
QuestionTextEmptyException )
() *
string* 0
?0 1
message2 9
,9 :
	Exception; D
?D E
innerExceptionF T
)T U
:V W
baseX \
(\ ]
message] d
,d e
innerExceptionf t
)t u
{ 	
} 	
	protected &
QuestionTextEmptyException ,
(, -
SerializationInfo- >
info? C
,C D
StreamingContextE U
contextV ]
)] ^
:_ `
basea e
(e f
infof j
,j k
contextl s
)s t
{ 	
} 	
} 
} ¹
[C:\Projects\HQTrivia\server\HQTrivia.Models\Models\Exceptions\QuizHasNotStartedException.cs
	namespace 	
HQTrivia
 
. 
Models 
. 
Models  
.  !

Exceptions! +
{ 
[ 
Serializable 
] 
public 

class &
QuizHasNotStartedException +
:, -
	Exception. 7
{ 
public &
QuizHasNotStartedException )
() *
)* +
{		 	
}

 	
public &
QuizHasNotStartedException )
() *
string* 0
?0 1
message2 9
)9 :
:; <
base= A
(A B
messageB I
)I J
{ 	
} 	
public &
QuizHasNotStartedException )
() *
string* 0
?0 1
message2 9
,9 :
	Exception; D
?D E
innerExceptionF T
)T U
:V W
baseX \
(\ ]
message] d
,d e
innerExceptionf t
)t u
{ 	
} 	
	protected &
QuizHasNotStartedException ,
(, -
SerializationInfo- >
info? C
,C D
StreamingContextE U
contextV ]
)] ^
:_ `
basea e
(e f
infof j
,j k
contextl s
)s t
{ 	
} 	
} 
} ¡
WC:\Projects\HQTrivia\server\HQTrivia.Models\Models\Exceptions\QuizNameEmptyException.cs
	namespace 	
HQTrivia
 
. 
Models 
. 
Models  
.  !

Exceptions! +
{ 
[ 
Serializable 
] 
public 

class "
QuizNameEmptyException '
:( )
	Exception* 3
{ 
public "
QuizNameEmptyException %
(% &
)& '
{		 	
}

 	
public "
QuizNameEmptyException %
(% &
string& ,
?, -
message. 5
)5 6
:7 8
base9 =
(= >
message> E
)E F
{ 	
} 	
public "
QuizNameEmptyException %
(% &
string& ,
?, -
message. 5
,5 6
	Exception7 @
?@ A
innerExceptionB P
)P Q
:R S
baseT X
(X Y
messageY `
,` a
innerExceptionb p
)p q
{ 	
} 	
	protected "
QuizNameEmptyException (
(( )
SerializationInfo) :
info; ?
,? @
StreamingContextA Q
contextR Y
)Y Z
:[ \
base] a
(a b
infob f
,f g
contexth o
)o p
{ 	
} 	
} 
} ­
YC:\Projects\HQTrivia\server\HQTrivia.Models\Models\Exceptions\QuizNameTooLongException.cs
	namespace 	
HQTrivia
 
. 
Models 
. 
Models  
.  !

Exceptions! +
{ 
[ 
Serializable 
] 
public 

class $
QuizNameTooLongException )
:* +
	Exception, 5
{ 
public $
QuizNameTooLongException '
(' (
)( )
{		 	
}

 	
public $
QuizNameTooLongException '
(' (
string( .
?. /
message0 7
)7 8
:9 :
base; ?
(? @
message@ G
)G H
{ 	
} 	
public $
QuizNameTooLongException '
(' (
string( .
?. /
message0 7
,7 8
	Exception9 B
?B C
innerExceptionD R
)R S
:T U
baseV Z
(Z [
message[ b
,b c
innerExceptiond r
)r s
{ 	
} 	
	protected $
QuizNameTooLongException *
(* +
SerializationInfo+ <
info= A
,A B
StreamingContextC S
contextT [
)[ \
:] ^
base_ c
(c d
infod h
,h i
contextj q
)q r
{ 	
} 	
} 
} ›
VC:\Projects\HQTrivia\server\HQTrivia.Models\Models\Exceptions\QuizNotFoundException.cs
	namespace 	
HQTrivia
 
. 
Models 
. 
Models  
.  !

Exceptions! +
{ 
[ 
Serializable 
] 
public 

class !
QuizNotFoundException &
:' (
	Exception) 2
{ 
public !
QuizNotFoundException $
($ %
)% &
{		 	
}

 	
public !
QuizNotFoundException $
($ %
string% +
?+ ,
message- 4
)4 5
:6 7
base8 <
(< =
message= D
)D E
{ 	
} 	
public !
QuizNotFoundException $
($ %
string% +
?+ ,
message- 4
,4 5
	Exception6 ?
?? @
innerExceptionA O
)O P
:Q R
baseS W
(W X
messageX _
,_ `
innerExceptiona o
)o p
{ 	
} 	
	protected !
QuizNotFoundException '
(' (
SerializationInfo( 9
info: >
,> ?
StreamingContext@ P
contextQ X
)X Y
:Z [
base\ `
(` a
infoa e
,e f
contextg n
)n o
{ 	
} 	
} 
} Ë
^C:\Projects\HQTrivia\server\HQTrivia.Models\Models\Exceptions\StartingDateNotValidException.cs
	namespace 	
HQTrivia
 
. 
Models 
. 
Models  
.  !

Exceptions! +
{ 
[ 
Serializable 
] 
public 

class )
StartingDateNotValidException .
:/ 0
	Exception1 :
{ 
public )
StartingDateNotValidException ,
(, -
)- .
{		 	
}

 	
public )
StartingDateNotValidException ,
(, -
string- 3
?3 4
message5 <
)< =
:> ?
base@ D
(D E
messageE L
)L M
{ 	
} 	
public )
StartingDateNotValidException ,
(, -
string- 3
?3 4
message5 <
,< =
	Exception> G
?G H
innerExceptionI W
)W X
:Y Z
base[ _
(_ `
message` g
,g h
innerExceptioni w
)w x
{ 	
} 	
	protected )
StartingDateNotValidException /
(/ 0
SerializationInfo0 A
infoB F
,F G
StreamingContextH X
contextY `
)` a
:b c
based h
(h i
infoi m
,m n
contexto v
)v w
{ 	
} 	
} 
} Í
>C:\Projects\HQTrivia\server\HQTrivia.Models\Models\Question.cs
	namespace 	
HQTrivia
 
. 
Models 
. 
Models  
{ 
public		 

class		 
Question		 
{

 
[ 	
Key	 
] 
[ 	
DatabaseGenerated	 
( #
DatabaseGeneratedOption 2
.2 3
Identity3 ;
); <
]< =
[ 	

JsonIgnore	 
] 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
[ 	
Required	 
] 
public 
string 
Text 
{ 
get  
;  !
set" %
;% &
}' (
[ 	

JsonIgnore	 
] 
public 
bool 
IsSent 
{ 
get  
;  !
set" %
;% &
}' (
=) *
false+ 0
;0 1
public 
int 
Duration 
{ 
get !
;! "
set# &
;& '
}( )
=* +
$num, .
;. /
public 
List 
< 
Answer 
> 
? 
Answers $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
int 
? 
QuizId 
{ 
get  
;  !
set" %
;% &
}' (
[ 	

ForeignKey	 
( 
$str 
) 
] 
[ 	

JsonIgnore	 
] 
[ 	
	NotMapped	 
] 
public 
Quiz 
? 
Quiz 
{ 
get 
;  
set! $
;$ %
}& '
} 
} °
:C:\Projects\HQTrivia\server\HQTrivia.Models\Models\Quiz.cs
	namespace 	
HQTrivia
 
. 
Models 
. 
Models  
{ 
public		 

class		 
Quiz		 
{

 
[ 	
Key	 
] 
[ 	
DatabaseGenerated	 
( #
DatabaseGeneratedOption 2
.2 3
Identity3 ;
); <
]< =
[ 	

JsonIgnore	 
] 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
[ 	
Required	 
] 
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
[ 	
Required	 
] 
public 
double 
Prize 
{ 
get !
;! "
set# &
;& '
}( )
[ 	
Required	 
] 
public 
string 
CurrencyType "
{# $
get% (
;( )
set* -
;- .
}/ 0
[ 	
Required	 
] 
public 
DateTime 
StartingDateTime (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
[ 	

JsonIgnore	 
] 
public 
DateTime 
CreatedDateTime '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
=6 7
DateTime8 @
.@ A
NowA D
;D E
public 
Status 
Status 
{ 
get "
;" #
set$ '
;' (
}) *
=+ ,
Status- 3
.3 4
	SCHEDULED4 =
;= >
public 
List 
< 
Question 
> 
? 
	Questions (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
string 
? 
ThumbNailURL #
{$ %
get& )
;) *
set+ .
;. /
}0 1
} 
} ¯
:C:\Projects\HQTrivia\server\HQTrivia.Models\Models\User.cs
	namespace 	
HQTrivia
 
. 
Models 
. 
Models  
{ 
public 

class 
User 
{ 
[ 	
Key	 
] 
public 
string 
Username 
{  
get! $
;$ %
set& )
;) *
}+ ,
public		 
int		 
Score		 
{		 
get		 
;		 
set		  #
;		# $
}		% &
=		' (
$num		) *
;		* +
}

 
} …
CC:\Projects\HQTrivia\server\HQTrivia.Models\Models\Utility\Prize.cs
	namespace 	
HQTrivia
 
. 
Models 
. 
Models  
.  !
Utility! (
{ 
public 

class 
Prize 
{ 
public 
double 
Value 
{ 
get !
;! "
set# &
;& '
}( )
public		 
string		 
CurrencyType		 "
{		# $
get		% (
;		( )
set		* -
;		- .
}		/ 0
}

 
} Þ
DC:\Projects\HQTrivia\server\HQTrivia.Models\Models\Utility\Status.cs
	namespace 	
HQTrivia
 
. 
Models 
. 
Models  
.  !
Utility! (
{ 
public		 

enum		 
Status		 
{

 
	SCHEDULED 
, 
OPEN_FOR_JOINING 
, 
IN_PROGRESS 
, 
FINISHED 
} 
} 