import { getAll } from '../services/visits/getAll';
import { getOne } from '../services/visits/getOne';
import { create } from '../services/visits/create';
import { update } from '../services/visits/update';
import { getByClient } from '../services/visits/getByClient';


export function getByClientData(req, res, next) {
  try {
    const { clientId } = req.body;
    getByClient(clientId).then(data => {
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
    const { date, sellerId, net, visitTotal, description, clientId } = req.body;
    create(date, sellerId, net, visitTotal, description, clientId)
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
    const { id, date, sellerId, net, visitTotal, description, clientId } = req.body;
    await update(id, date, sellerId, net, visitTotal, description, clientId)
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