terraform {

  cloud {
    organization = "morgan-peat-ec"

    workspaces {
      name = "foo-dev-resources"
    }
  }
}

