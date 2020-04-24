# Install and configure groups and users from data backend
class hpcusers(
  Hash $groups,
  Hash $users) {

  $groups.each |$group, $opts| {
    group { $group:
      * => $opts,
    }
  }

  if defined('$tortuga_kit_uge::execd::svcname') and
    defined(Service[$tortuga_kit_uge::execd::svcname]) {
    User <| tag == 'hpcusers' |> -> Service <| title == $tortuga_kit_uge::execd::svcname |>
  }

  $users.each |$username, $opts| {
    user { $username:
      * => $opts,
    }
  }

}
