/*
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import React from "react";

const initialState = {
    diagram: null,
    filename: ''
};

const editor = (state = initialState, action) => {
    switch (action.type) {
        case 'SET_EDITOR_DIAGRAM':
            return { ...state, diagram: action.diagram, filename: (action.filename || '') };
        case 'SET_EDITOR_FILENAME':
            return { ...state, filename: (action.filename || '') };
        default:
            return state
    }
};

export default editor;
