import db from '../../database/models/index';

const create = async (date, srId, net, visitTotal, description, clientId) => {
  return await db.visits.create({
      date, srId, net, visitTotal, description, clientId
        }).then(data => {
          return data;
        }).catch(e => {
          console.log(e);
        });
}

module.exports = {
  create
}
