import { groupService } from '../_services';
import { router } from '../router';

const groups = JSON.parse(localStorage.getItem('groups'));
const state = {
    all: groups
};

const actions = {
    getAll({ commit }) {
        commit('getAllRequest');

        groupService.getAll()
            .then(
                users => commit('getAllSuccess', users),
                error => commit('getAllFailure', error)
            );
    },

    delete({ commit }, id) {
        commit('deleteRequest', id);

        groupService.delete(id)
            .then(
                user => commit('deleteSuccess', id),
                error => commit('deleteSuccess', { id, error: error.toString() })
            );
    }
};

const mutations = {
    getAllRequest(state) {
        state.all = { loading: true };
    },
    getAllSuccess(state, groups) {
        state.all = { items: groups };
    },
    getAllFailure(state, error) {
        state.all = { error };
    },
    deleteRequest(state, id) {
        // add 'deleting:true' property to user being deleted
        state.all.items = state.all.items.map(group =>
            group.id === id
                ? { ...group, deleting: true }
                : group
        )
    },
    deleteSuccess(state, id) {
        // remove deleted group from state
        state.all.items = state.all.items.filter(group => group.id !== id)
    },
    deleteFailure(state, { id, error }) {
        // remove 'deleting:true' property and add 'deleteError:[error]' property to group
        state.all.items = state.items.map(group => {
            if (group.id === id) {
                // make copy of user without 'deleting:true' property
                const { deleting, ...groupCopy } = group;
                // return copy of user with 'deleteError:[error]' property
                return { ...groupCopy, deleteError: error };
            }

            return group;
        })
    }
};

export const groups = {
    namespaced: true,
    state,
    actions,
    mutations
};
