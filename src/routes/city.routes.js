import { Router } from 'express';
import { getAllData, getOneData, createRegister, updateRegister, getByStateData } from '../controllers/city.controller';
const router = Router();

router.post('/', getAllData);
router.post('/create', createRegister);
router.post('/update', updateRegister);
router.post('/read', getOneData);
router.post('/getByState', getByStateData);

export default router;