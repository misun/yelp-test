import React from 'react';

class BusinessItemDetail {

  constructor(props){
    super(props);

  }
  componentDidMount(){
    
  }

  render(){
    return (
      <ul>
        <li>{ this.props.business.name }</li>
        <li>{ this.props.business.price_range }</li>
        <li>{ this.props.business.category }</li>
        <li>{ this.props.business.address }</li>
        <li>{ this.props.business.phone }</li>
        <li>{ this.props.business.monday }</li>
        <li>{ this.props.business.tuesday }</li>
        <li>{ this.props.business.wednesday }</li>
        <li>{ this.props.business.thursday }</li>
        <li>{ this.props.business.friday }</li>
        <li>{ this.props.business.saturday }</li>
        <li>{ this.props.business.sunday }</li>
      </ul>
    );
  }

}

export default BusinessItem;
