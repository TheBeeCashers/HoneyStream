import { authHeader } from '../_helpers';
import config from '../config';

export const videoService = {
  getAll,
  getById,
};

function getAll() {
  const requestOptions = {
    method: 'GET',
    headers: authHeader(),
  };

  return fetch(`${config.apiUrl}/api/videos`, requestOptions).then(handleResponse);
}

function getById(id) {
  const requestOptions = {
    method: 'GET',
    headers: authHeader(),
  };

  return fetch(`${config.apiUrl}/api/videos/${id}`, requestOptions).then(handleResponse);
}

function postPayment(id, userId) {

}

function handleResponse(response) {
  return response.text().then((text) => {
    const data = text && JSON.parse(text);

    console.log(data);

    if (!response.ok) {
      if (response.status === 401) {
        // auto logout if 401 response returned from api
        logout();
        location.reload(true);
      }

      const error = (data && data.message) || response.statusText;
      return Promise.reject(error);
    }

    return data;
  });
}
