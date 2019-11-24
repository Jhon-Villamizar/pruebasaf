import db from '../../database/models/index';

const update = async (id, date, srId, net, visitTotal, description, clientId) => {
  return await db.visits.update({
    id, date, srId, net, visitTotal, description, clientId
  }, {
    where : {
      id: id
    }
  }).then(data => {
    return data;
  }).catch(e => {
    console.log(e);
  });
}

module.exports = {
  update
}
