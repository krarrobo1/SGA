import './app';

function main(){
    app.listen(process.env.PORT);
    console.log('Server on port:', process.env.PORT) 
};

main();