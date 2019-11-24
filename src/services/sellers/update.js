import db from '../../database/models/index';

const update = async (id, name, cc) => {
  return await db.sellers.update({
    id, name, cc
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
