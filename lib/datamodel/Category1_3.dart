


class DataCategory1_3{
  //index= 7 is the center
  var topiclearn = [

    ["กะ","ปะ","มะ","ระ","บะ","ปะ","ปะ","ขา","สะ","จะ","งา","จา","ปี","อา","หนู"],
    ["กา","ขา","คา","งู","ปา","แห","แม","งา","มา","คา","งา","จา","ปี","อา","หนู"]


  ];
  //index = 7, no need to check
  var answer = [
    ["กะ","ปะ","มะ","ระ","บะ","ปะ","ปะ","","สะ","จะ","","","","",""],
    ["กา","ขา","คา","","ปา","","","งา","มา","คา","งา","จา","","อา",""]];
//question  word in central and the number of correct answers
  var question = [["ปะ",9 ], ["งา",10 ] ];
  var datatopiclearn ;
  var dataanswer ;
  var learningtopic;
  DataCategory1_3(topic){

      learningtopic = topic;

   }
   getChoice(){
    return topiclearn[learningtopic];
   }
   getAnswer(){
     return answer[learningtopic];
   }
   getQuestion(){
    return question[learningtopic][0];

   }
  getCorrectNumber(){
    return question[learningtopic][1];

  }
}