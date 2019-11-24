import { getAll } from '../services/states/getAll';
import { getOne } from '../services/states/getOne';
import { create } from '../services/states/create';
import { update } from '../services/states/update';



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
    const { name, status, iso3 } = req.body;
    create(name, status, iso3)
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
    const { status,id } = req.body;
    await update(id, status)
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