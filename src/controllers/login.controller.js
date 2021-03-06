require('../config/config');
import Credential from '../models/Credential';
import User from '../models/User';
import Category from '../models/Category';
import Titulation from '../models/Titulation';
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');


export async function login(req, res) {
    const { email, password } = req.body;

    try {
        const emailFound = await Credential.findOne({
            where: {
                email
            }
        })
        if (!emailFound) {
            return res.status(400).json({
                message: "The email or password is not correct",
                data: {}
            })
        }
        if (!(await bcrypt.compareSync(password, emailFound.password))) {
            return res.status(400).json({
                message: "The email or password is not correct",
                data: {}
            })
        }
        const userFound = await User.findOne({                      // devolver el usuario o las credenciales ?
            where: {
                ci: emailFound.userid,
                status: true
            },
            attributes:['ci', 'name', 'lastname', 'dateofbirth', 'status']
            ,
            include: [{
                model: Category,
                as: 'rol',
                attributes:['id', 'name']
            },{
               model: Titulation,
               attributes:['id', 'name'] 
            }]
        })

        const userToken= await User.findOne({                     
            where: {
                ci: emailFound.userid,
                status: true
            }
        });

        if(!userFound){
            return res.status(400).json({
                message: "The User does not exist",
                data: {}
            })
        }

        let token = jwt.sign({
            data: userToken
        }, process.env.SEED, { expiresIn: process.env.TOKENEXPIRATION });

        res.json({
            message: "Welcome!",
            data: userFound,
            token
        })
    } catch (error) {
        console.log(error);
        res.status(500).json({
            message: "Something goes wrong",
            error
        })
    }
};