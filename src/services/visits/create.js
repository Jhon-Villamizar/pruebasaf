import db from '../../database/models/index';

const create = async (date, sellerId, net, visitTotal, description, clientId) => {
  return await db.visits.create({
      date, sellerId, net, visitTotal, description, clientId
        }).then(data => {
          return data;
        }).catch(e => {
          console.log(e);
        });
}

module.exports = {
  create
}
