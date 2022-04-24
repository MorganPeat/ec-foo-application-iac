terraform {

  cloud {
    organization = "morgan-peat-ec"

    workspaces {
      name = "foo-int-resources"
    }
  }
}

