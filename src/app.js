//app nodejs Safetti custom  -- Chef
import express, { json } from 'express';
import morgan from 'morgan';//middleware de registrador de solicitudes HTTP
import cors from 'cors';//cabeceras
import path from 'path';

//cargamos las rutas creadas en la carpeta routes
import countryRoutes from './routes/country.routes';
import stateRoutes from './routes/state.routes';
import cityRoutes from './routes/city.routes';
import sellerRoutes from './routes/seller.routes';
import visitRoutes from './routes/visit.routes';
import clientRoutes from './routes/client.routes';

// import logsRoutes from './routes/payments.routes';
// import uerrorsRoutes from './routes/u.routes';


//Server express
const app = express();

// middlewares
app.use(morgan('dev'));
app.use(json());
app.use(cors());
app.use(express.static('public'));
app.set('views', path.join(__dirname, 'public/templates'));
app.set('view engine', 'ejs');

// routes config
app.use('/api/countries', countryRoutes);
app.use('/api/states', stateRoutes);
app.use('/api/cities', cityRoutes);
app.use('/api/sellers', sellerRoutes);
app.use('/api/visits', visitRoutes);
app.use('/api/clients', clientRoutes);

export default app;
