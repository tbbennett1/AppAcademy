export const signup = user => (
    $.ajax({
        url: '/api/users',
        method: 'POST',
        data: { user },
    })
);

export const login = user => {
    return $.ajax({
        url: '/api/session',
        method: 'POST',
        data: { user }
    })
};

export const logout = () => (
    $.ajax({
        url: '/api/session',
        method: 'DELETE'
    })
)