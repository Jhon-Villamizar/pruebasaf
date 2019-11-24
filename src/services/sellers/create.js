import db from '../../database/models/index';

const create = async (name,cc) => {
  return await db.sellers.create({
        name,cc
        }).then(data => {
          return data;
        }).catch(e => {
          console.log(e);
        });
}

module.exports = {
  create
}
