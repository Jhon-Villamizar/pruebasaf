import { Router } from 'express';
import { getAllData, getOneData, createRegister, updateRegister } from '../controllers/country.controller';
const router = Router();

router.post('/', getAllData);
router.post('/create', createRegister);
router.post('/update', updateRegister);
router.post('/read', getOneData);

export default router;