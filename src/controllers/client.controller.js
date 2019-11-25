import { getAll } from '../services/clients/getAll';
import { getOne } from '../services/clients/getOne';
import { create } from '../services/clients/create';
import { update } from '../services/clients/update';



export function getAllData(req, res, next) {
  try {
    getAll().then(data => {
      res.status(200).json({
        message: 'All data',
        data: data
      });
    }).catch(e => {
      console.log(e);
    });

  } catch (e) {
    console.log(e);
    res.status(500).json({
      message: 'Something goes wrong',
      data: {},
      error: true
    });
  }
};


export function getOneData(req, res, next) {
  try {
    const { id } = req.body;
    getOne(id).then(data => {
      res.status(200).json({
        message: '200',
        data: data
      });
    });
  } catch (e) {
    console.log(e);
    res.status(500).json({
      message: 'Something goes wrong',
      data: {},
      error: true
    });
  }
}

export async function createRegister(req, res, next) {
  try {
    const { nit, name, address, phone, creditLimit, availableCredit, visitPercentage, description, countryId, stateId, cityId } = req.body;
    create(nit, name, address, phone, creditLimit, availableCredit, visitPercentage, description, countryId, stateId, cityId)
    .then(data => {
      res.status(200).json({
        message: 'Created successfully',
        data: data
      });
    })
    .catch(e => {
      console.log(e);
    });
  } catch (e) {
    res.status(500).json({
      message: 'Something goes wrong',
      data: {},
      error: true
    });
  }
}

export async function updateRegister(req, res, next) {
  try {
    const { id, nit, name, address, phone, creditLimit, availableCredit, visitPercentage, description, countryId, stateId, cityId } = req.body;
    await update(id, nit, name, address, phone, creditLimit, availableCredit, visitPercentage, description, countryId, stateId, cityId)
      .then(data => {
        res.json({
          message: 'Updated successfully',
          data: data
        });
      }
      ).catch(e => {
        console.log(e);
      });
  } catch (e) {
    res.status(500).json({
      message: 'Something goes wrong',
      data: {},
      error: true
    });
  }
}