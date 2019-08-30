import { fetchBenches } from "../util/bench_api_util"

export const RECEIVE_BENCHES = 'RECEIVE_BENCHES';

const receiveBenches = benches => ({
    type: RECEIVE_BENCHES,
    benches,
})

export const fetchBenchesTAC = () => dispatch => fetchBenches()
    .then(benches => dispatch(receiveBenches(benches)));