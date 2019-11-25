import db from '../../database/models/index';

const getByClient = async (clientId) => {
  return await db.visits.findAll({
    where:{
        clientId
    }
  }).then(data => {
    return data;
  }).catch(e => {
    console.log(e);
  });
}

module.exports = {
    getByClient
}