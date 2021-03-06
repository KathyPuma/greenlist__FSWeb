const db = require('../helpers/db');


const getAllPhotos = async () => {
    const getQuery = `
      SELECT *
      FROM photos;
    `;
    return await db.any(getQuery);
}


const getPhotosByReclaimId = async (id) => {
    try {
      const getQueryById = `
        SELECT *
        FROM photos
        WHERE reclaim_id = $/id/;
      `;
      return await db.any(getQueryById, { id });
    } catch (err) {
      throw (err);
    }
}


const addPhoto = async (bodyObj) => {
    try {
        const postQuery = `
          INSERT INTO photos(photo_url,
              reclaim_id
          )
          VALUES($/photo_url/,
              $/reclaim_id/
          );
        `;
        return await db.any(postQuery, bodyObj);
    } catch (err) {
        if (err.message.includes("violates unique constraint")) {
            throw new Error(`404__error: reclaim '${reclaim_id}' does not exist`);
        }
        throw (err);
    }
}


const deletePhoto = async (id) => {
    try {
      const deleteQuery = `
        DELETE FROM photos
        WHERE id = $/id/;
      `;

      return await db.none(deleteQuery, {id});
    } catch (err) {
      throw (err);
    }
  }


module.exports = {
    getAllPhotos,
    getPhotosByReclaimId,
    addPhoto,
    deletePhoto
}
