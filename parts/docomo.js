// Description:
//   Messing around with the today API.
const keDocomo=require('ke-docomo');
module.exports=(robot) => {
  console.log('start docomo.js');
  let Dc=new keDocomo();
  //
  robot.hear(/^docomo/, (msg)=> {
    let reply=Dc.dialogue(msg.message.txt);
    msg.send(reply);
  });
};
