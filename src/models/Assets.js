import Sequelize from 'sequelize';
import {sequelize} from '../database/database';

const Assets = sequelize.define('assets',{
    id:{
        type: Sequelize.INTEGER,
        primaryKey: true
    },
    imageurl:{
        type: Sequelize.STRING
    },
    publicid:{
        type : Sequelize.STRING
    },
    categoryid:{
        type: Sequelize.INTEGER
    }
    // postId:{
    //     type : Sequelize.INTEGER                // Se agrega esta fk ?
    // }
},{
    timestamps: false
});

export default Assets;