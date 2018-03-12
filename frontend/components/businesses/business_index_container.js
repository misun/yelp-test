import { connect } from 'react-redux';
import BusinessIndex from './business_index';
import { fetchAllBiz } from '../../actions/business_actions';
import { fetchBizAllPhotos } from '../../actions/photo_actions';

const msp = state => ({
  businesses: Object.values(state.entities.businesses)
});

const mdp = dispatch => ({
  fetchAllBiz: () => dispatch(fetchAllBiz()),
  fetchBizAllPhotos: ( bizId ) => dispatch( fetchBizAllPhotos( bizId ))
});

export default connect(msp, mdp)(BusinessIndex);
