import { Router } from 'express';
import { getAllData, getOneData, createRegister, updateRegister, getByClientData } from '../controllers/visit.controller';
const router = Router();

router.post('/', getAllData);
router.post('/create', createRegister);
router.post('/update', updateRegister);
router.post('/read', getOneData);
router.post('/getByClient', getByClientData);

export default router;