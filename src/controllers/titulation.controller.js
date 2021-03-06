import Titulation from '../models/Titulation';
import Area from '../models/Area';

export async function getAreas(req, res){

    try {
        const areas = await Titulation.findAll({
            where:{
                areaid: null
            }
        });
        res.json({
            data: areas
        })        
    } catch (error) {
        res.status(500).json({
            message: "Something goes wrong",
            error  
        })
    }
}

export async function getAreasAndTitulation(req, res){

    try { 
        const data = await Area.findAll({
            include: [{
                model: Titulation,
                as: 'titulaciones'
            }]
        });
        return res.json({
           data
        });
        
    } catch (error) {
        console.log(error);
        res.status(500).json({
            message: "Something goes wrong",
            error  
        })
    }
}

export async function createAreaOrTitulation(req, res) {
    
    const {name, description, areaid} = req.body;
    let areaidAux = null; 

    try {

        if(areaid){
            areaidAux = areaid; 
        }
        
        let newTitulation = await Titulation.create({
            name,
            description,
            areaid: areaidAux
        },{
            fields: ['name', 'description', 'areaid']
        });

        if(newTitulation){
            return res.json({
                message: "Titulation or Area created successfully",
                data: { newTitulation}
            })
        }
    } catch (error) {
        console.log(error);
        res.status(500).json({
            message: 'Something goes wrong',
            error
        })
    }

}