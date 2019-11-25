import db from '../../database/models/index';

const getByState = async (stateId) => {
  return await db.cities.findAll({
    where:{
      stateId
    }
  }).then(data => {
    return data;
  }).catch(e => {
    console.log(e);
  });
}

module.exports = {
    getByState
}
