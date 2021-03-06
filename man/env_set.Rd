% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/env.R
\name{env_set}
\alias{env_set}
\alias{env_set.function}
\alias{env_set.formula}
\alias{env_set.environment}
\alias{env_set_parent}
\title{Set an environment.}
\usage{
env_set(env, new_env)

\method{env_set}{function}(env, new_env)

\method{env_set}{formula}(env, new_env)

\method{env_set}{environment}(env, new_env)

env_set_parent(env, new_env)
}
\arguments{
\item{env}{An environment or an object with a S3 method for
\code{env_set()}.}

\item{new_env}{An environment to replace \code{env} with. Can be an
object with an S method for \code{env()}.}
}
\description{
\code{env_set()} does not work by side effect. The input is copied
before being assigned an environment, and left unchanged. However,
\code{env_set_parent()} operates on the inner environment and does
have a side effect.
}
\examples{
# Create a function with a given environment:
env <- new_env(base_env())
fn <- with_env(env, function() NULL)
identical(env(fn), env)

# env_set() does not work by side effect. Setting a new environment
# for fn has no effect on the original function:
other_env <- new_env()
env_set(fn, other_env)
identical(env(fn), other_env)

# env_set() returns a new function with a different environment, so
# you need to assign the returned function to the `fn` name:
fn <- env_set(fn, other_env)
identical(env(fn), other_env)
}
