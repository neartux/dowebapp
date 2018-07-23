package com.reliablesystems.doctoroffice.auth;

import com.reliablesystems.doctoroffice.core.domain.Role;
import com.reliablesystems.doctoroffice.core.domain.User;
import com.reliablesystems.doctoroffice.core.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class CustomAuthUserService implements UserDetailsService {
    @Autowired
    private UserService userService;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        //se obtiene el usuario
        final User user = findUserByPrimaryKey(username);
        //se obtienen los roles
        final List<Role> rolesCollection = userService.findRolesByUserId(user.getId());

        return new UserDetails() {
            @Override
            public Collection<? extends GrantedAuthority> getAuthorities() {
                return getGrantedAuthorities(rolesCollection);
            }

            @Override
            public String getPassword() {
                return user.getPassword();
            }

            @Override
            public String getUsername() {
                return user.getUserName();
            }

            @Override
            public boolean isAccountNonExpired() {
                return true;
            }

            @Override
            public boolean isAccountNonLocked() {
                return true;
            }

            @Override
            public boolean isCredentialsNonExpired() {
                return true;
            }

            @Override
            public boolean isEnabled() {
                return true;
            }
        };
    }

    /**
     * Generate a list of grantedauthorities to aunthentication
     *
     * @param roleList List of roles by user
     * @return List of grantedauthorities
     */
    private static List<GrantedAuthority> getGrantedAuthorities(List<Role> roleList) {
        List<GrantedAuthority> authorities = new ArrayList<>();
        for (Role role : roleList) {
            authorities.add(new SimpleGrantedAuthority(role.getName()));
        }
        return authorities;
    }


    /**
     * Verify that user is active and the user exist
     *
     * @param username The username
     * @return If user exist the user, if not empty user
     */
    private User findUserByPrimaryKey(String username) {
        User user = userService.findUserByUserName(username);
        // Validate user
        if(user != null) {
            return user;
        }
        return new User();
    }
}
