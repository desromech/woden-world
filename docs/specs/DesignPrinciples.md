# WODEN Engine World - Design Principles

This document describes the underlying design principles for the open specification of the WODEN World underlying system and protocols. These core principles are meant to construct a system that highly decoupled and flexible on its different underlying components. The election of these design principles is taken from experience acquired across multiple industries and open source communities, like the web, networking, programming languages, and the video game industry.

## The Meta-Problem

They are multiple attempts on constructing a highly connected and immersive 3D environment that is known as **metaverse**. Many of these implementations are condemned to fail because they are a solution that is awaiting a problem. Everybody on the media talks about the so-called *metaverse*, but nobody explains why is this system required in our daily lives, and what specific problem solves. After analyzing this solution, we noticed that the actual problem that it attempts to solve is a difficult one to identify because it is not just a problem, but it is instead a meta-problem, in other words, a problem of problems. The following is the actual problem statement that is attempted to be solved by this solution:

*Current computer systems user interfaces are non-intuitive for non-technical people.*

We conjecture that this highly questionable problem seems to be highly correlated by the following factors that depends on the user:

1. Training on computer system usage
2. Cultural background
3. Age

We hypothesize that in many occasions this is not an actual problem, and this seems to be one of the reasons for the failure of the many attempted metaverse solutions among the people that is used for playing videogames, or that is used to everyday work that uses a computer.

Since this is a meta-problem, there are multiple specific problems whose solution is attempted to be facilitated by solving the meta-problem. The following is a non-exhaustive list of the different specific problems, we also specify they way that there are solved after the colon:

- Collaboration: Text chat and video conference application
- Immersion: First person shooter video games
- Extensibility and openness: Web and standard protocols
- Networking: Mail, web, multiplayer video games, etc
- Distributed computing: Actor model
- Portable OS and sandbox: Javascript and WASM in the Web
- 3D Graphics and modeling: 3D modeling and animation suites like Blender

We hypothesize that one approach to solve the meta-problem is by constructing the following:

*An intuitive extension of computer human interactions that is based on physical real world experience with the purpose of interacting, controlling, and manipulating distributed computer systems and interacting and collaborating with other humans at distance in the same process*

The so called metaverse is a solution to the meta-problem by constructing a 3D immersive user interface that is based in physical reality. The truth is that the meta-problem solution requires the usage of both, 2D and 3D user interfaces. In fact, there is vast research coming from the information visualization community that shows that in many occasions, the usage of 3D visualizations is vastly inferior to the usage of a 2D visualization. Problems like occlusion and the difficulty on depth perception tends to be a deal-breaker when using a 3D visualization instead of a 2D one. For this very same reason, we propose the following mandatory requirement for any system that attempts to construct a metaverse that wants to succeed:

**The usage of immersive 3D Graphics MUST BE OPTIONAL**

The abuse of the word *metaverse* due to the several projects that attempt to sell smoke by constructing a proprietary and closed system. This goes completely against the spirit of the open world wide web, that is supposedly to be augmented by the metaverse, has turned it into a word that cannot be used in serious business spaces. For this reason we won't be using the word *metaverse* anymore across this document, instead we will say that we are constructing the WODEN Engine World (WEW), abbreviated as the WODEN World or Woden World.

## Core System Design Principles

The following sections categorizes and describes each one of these underlying core design principles for this open system.

### Open and Public Specification is Required

The World Wide Web is a huge success because it is based on a completely public specification that is not controlled by anyone. Any kind of system that attempts to replicate its success by expanding on it by adding an immersive 3D user interface has to replicate on this concept. In fact, this system has to be designed to be used as a complement to the existent WWW infrastructure, which implies that it has to take advantage of its existent protocols and file formats as much as possible. Each one of the underlying networking protocols and file formats must be documented down to the byte level. The only admissible exception for not documenting a protocol or file format is by referring an existent document and or open standard which already does this.

### Use Standard Protocols As Much As Possible

Standard networking protocols must be used in this system as much as possible in order to avoiding reinventing the wheel, and to facilitate reusing as much standard infrastructure as possible. The following is a non-exhaustive list of networking protocols that must be used in this system:

- HTTP(S). The Hyper Text Transfer Protocol nowadays permeates everything, so it is a safe basis for constructing any kind of networking system. In fact, the presence of corporate firewalls that only allows http(s) traffic implies that its usage as a transport protocol is mandatory.
- WebSockets for in world synchronization via message passing. Use multiple streams to differentiate latency sensitivities.
- REST APIs for uploading and committing documents.
- OAuth when authentication is required.
- MessagePack for efficient and schema-less binary message encoding.

### Use Standard File Formats As Much As Possible

The same reasoning that is applied to the selection of standard networking protocols, it is also applied to the selection of file formats. In other words, standard file formats that are already widely supported in the existing Web infrastructure must be used as much as possible. The following is a list of selected formats:

- PNG for images with lossless compression.
- JPEG for images with lossy compression.
- GLTF 2.0 for static model assets which are referenced by hyperlinks.
- JSON based formats for the cases where an existing file format does not suffice. We do this for the persistence of the world, and storing the metadata that is required for establishing an interactive and collaborative session.

### Distributed Computing via the Actor Model and RESTfull message passing

We propose that in-environment synchronization is performed by using at least two different communication channels, which are selected according to the frequency and latency requirement of the messages. These two synchronization and communication channels are the following:

- Actor Model synchronization via message passing. Actor have an unique name in the world session, and their messages are binary encoded and routed through a reflector. The reflector takes care of sorting and sending message in a way that facilitates deterministic lockstep synchronization for P2P network topologies.
- RESTfull APIs for communicating with existing Web Services, and for persisting large binary assets and documents. This communication channel is used for storing and receiving data that is not sensitive like 3D models, textures, and other documents. These assets are loaded by using the standard HTTP GET method, and they are uploaded by using the standard POST method onto an URL that is declaratively specified by the World document. This approach facilitates the usage of standard data storage, replication and load balancing services that are already used by existent Web applications.

### Different Levels of Replication and Synchronization Required

Some of the existent implementations like Croquet suffer of not separating the objects/actors according to the different levels of replications that they actually require. Croquet in particular suffers of performing replication and synchronization on a granularity that is too fine, down to individual objects of the OOP programming language. This fine granularity suffers of excessive message passing and synchronization, and it makes it difficult to separate synchronization from the 3D rendering presentation. This problem is perceived as high latency and low framerate by the user. To avoid this problem, we propose clustering actors according to the following different levels of replication:

- Static immutable un-replicated actors.
- Dynamic fully deterministic replicated actors. They can be synchronized via deterministic lockstep.
- Non-deterministic distributed actors. They live on their own servers with a public entry point (REST style API, of the message passing interface)

### Support Multiple Synchronization Strategies

We propose that different kind of synchronization strategies must be supported according to multiple factors like the level of collaboration that is required by the users, the massiveness of the experience, and whether or not different levels of interactions are required. In the following subsections we describe some the different synchronization strategies.

#### Single Player Solo Experience

The easiest case to support is the single player solo experience. In this case, no replication and synchronization at all is needed. Even though the emphasis on this kind of systems tends to be placed on the support of collaboration, there are actually several use cases where this is actually useful and required. A typical use case is an architectural visualization that is presented to clients. The advantage of this use case is that a standard web server that is used for serving static files is enough for this use case.

The usage of a simplistic web server can be augmented by a side channels that allows to interconnect friends, which is known as a separate matchmaking server. This side channel allows separating completely the document storage infrastructure from the synchronization infrastructure and server requirements.

#### Client-Server Authoritative Synchronization

The traditional client-server architecture introduced by the classic Quake video game into 3D games. In this network topology and architecture, the true world state is kept by a central machine known as the server. The server performs the simulation of the world, whose state is influenced by the different inputs that it receives from the users. The server sends periodical updates to the clients of the whole world state. These periodical updates typically contains the positions, velocities, and orientations of the different world entities.

One important advantage of the client-server architecture is that it facilitates adding and removing multiple clients. A client that joins only need to accept the world state of the next periodical update. One drawback of this architecture is that it is sensitive to the per-client roundtrip latency. This latency is typically masked by using client-side prediction, which was one of the important innovations introduced by the original Quake video game.

#### P2P Deterministic Lockstep Synchronization

Another important networking synchronization architecture is known as deterministic lockstep. In this architecture, the synchronization is performed by having a deterministic simulation of the world state, which is deterministic and produces the exact same results down to the bit-level. This architecture is typically used in real-time strategy videogames (RTS). Croquet uses this architecture for its synchronization, but it introduces a server in the middle that is known as a *reflector*. The job of the reflector is to sort messages and to add a timestamp to them, with the objective of distributing all of the messages into all of the clients in the same order, so that they can perform the exact same deterministic simulation. Another modification of this synchronization architecture consists on adding prediction via speculative execution, which is typically done in highly latency sensitive applications like fighting videogames. GGPO is a widely popular middleware that facilitates implementing deterministic lockstep with speculative execution via prediction in fighting videogames. We propose specifying a protocol that allows deterministic lockstep synchronization by using a WebSocket based reflector server, but that does allow the freedom of choosing the actual latency masking mechanism to the different client implementors.

One problem of using deterministic lockstep as the synchronization mechanism is that it presents an additional difficulty on supporting clients that join in the middle of the session. A client that is joining to a session requires an initial state of the world. In the case of joining in the middle of a session, one of the clients that is already present has to perform a serialization of the world state, and then it has to transmit it into the client that is joining. If this process is not properly handle, it can introduce a pause into the environment simulation. In addition to the pause, it also suffers of an important security issue, since it places the trust of the world state onto individual clients. If the client that performs the world state serialization decides to act maliciousness, or even worse, it is badly implemented, then it will be transmitting a wrong world state to the client that is joining in the middle of the session.

#### Client-Server and Deterministic Lockstep Hybrid Approach

Another alternative that might be required to be explored is the support of a hybrid approach where most of the synchronization is performed by using deterministic lockstep. However, there is an additional server that is keeping the authority on the real world state by simulating the messages in the correct order and with the implementation that the server operators decided to trust. This approach allows combining the scalability advantages with having a central authority that defines the true world state that can be trusted and facilitates new clients joining to the session.
