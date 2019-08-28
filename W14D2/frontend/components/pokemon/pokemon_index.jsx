import React from 'react';

class PokemonIndex extends React.Component{
   constructor(props){
      super(props)
      this.state = {};
     
   }

  componentDidMount(){
     debugger
    this.props.requestAllPokemon()
  }
  
   render(){
      let allPokemon = this.props.pokemon //.map(ele => ele)
      debugger

      return (
         <ul>
          { allPokemon.map(el =>{
             return (
               <li>
                  {el.name}
                  <img src={el.image_url} />
               </li>
               )
             }
             )}

         </ul>
      )
   }
}

export default PokemonIndex