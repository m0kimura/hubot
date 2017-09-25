// Description:
//   Messing around with the today API.
const keRecruit=require('ke-recruit');
module.exports=(robot) => {
  console.log('start recruit.js');
  let Rc=new keRecruit();
  //
  robot.hear(/^recruit/i, (msg)=>{
    let reply=Rc.dialogue(msg.message.txt);
    msg.send(reply);
  });
};
