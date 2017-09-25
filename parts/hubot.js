const keDocomo=require('ke-docomo');
const keRecruit=require('ke-recruit');
module.exports=(robot) => {
  let Dc=new keDocomo();
  let Rc=new keRecruit();
  //
  robot.hear(/^docomo/, (msg)=> {
    let reply=Dc.dialogue(msg.message);
    msg.send(reply);
  });
  //
  robot.hear(/^recruit/i, (msg)=>{
    let reply=Rc.dialogue(msg.message);
    msg.send(reply);
  });
};
