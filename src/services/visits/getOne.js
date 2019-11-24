import db from '../../database/models/index';

const getOne = async (id) => {
  return await db.visits.findOne({
    where: { id : id }
  }).then(data => { return data }).catch(e => {
    console.log(e);
  });
}

module.exports = {
  getOne
}
